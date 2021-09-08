namespace: VS.RemoteExecution
flow:
  name: run_AFL_flow
  inputs:
    - flow_uuid:
        prompt:
          type: text
        default: 249d3f4a-a6cc-4cd3-8748-9eddfa0352f3
    - oo_central:
        prompt:
          type: text
        default: rpa2.csademo.hpeswlab.net
    - oo_password:
        prompt:
          type: text
        default: Admin@123
        sensitive: true
    - oo_port: '8443'
    - oo_user:
        prompt:
          type: text
        default: vieri
        sensitive: true
    - run_name:
        prompt:
          type: text
        default: generate random number
    - inputs:
        prompt:
          type: text
        default: seconds
        required: false
    - values:
        prompt:
          type: text
        default: '30'
  workflow:
    - base64_encoder:
        do:
          io.cloudslang.base.utils.base64_encoder:
            - data: "${oo_user+':'+oo_password}"
            - character_set: ''
        publish:
          - encodedString: '${result}'
        navigate:
          - SUCCESS: create_input_json
          - FAILURE: on_failure
    - run_oo_flow:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: "${'https://'+oo_central+':'+oo_port+'/oo/rest/v2/executions'}"
            - auth_type: basic
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - headers: '${"Authorization: Basic "+ encodedString}'
            - body: "${'{ \"flowUuid\":\"'+ flow_uuid +'\", \"runName\":\"'+ run_name + '\",\"logLevel\":\"STANDARD\",' + inputs_json + ' }'}"
            - content_type: application/json
        publish:
          - oo_run_id: '${return_result}'
          - error_message
          - return_code
          - status_code
          - response_headers
        navigate:
          - SUCCESS: compare_numbers
          - FAILURE: on_failure
    - create_input_json:
        do:
          Tests.RemoteExecution.create_input_json:
            - inputs: '${inputs}'
            - values: '${values}'
        publish:
          - inputs_json
        navigate:
          - SUCCESS: is_null
    - is_null:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${inputs_json}'
        publish: []
        navigate:
          - IS_NULL: FAILURE
          - IS_NOT_NULL: run_oo_flow
    - compare_numbers:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${status_code}'
            - value2: '201'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: get_oo_flow_execution_status
          - LESS_THAN: FAILURE
    - get_oo_flow_execution_status:
        do:
          Tests.RemoteExecution.get_oo_flow_execution_status:
            - oo_central: '${oo_central}'
            - oo_password:
                value: '${oo_password}'
                sensitive: true
            - oo_port: '${oo_port}'
            - oo_run_id: '${oo_run_id}'
            - oo_user:
                value: '${oo_user}'
                sensitive: true
        publish:
          - oo_flow_status
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      base64_encoder:
        x: 87
        'y': 111
      run_oo_flow:
        x: 393
        'y': 112
      create_input_json:
        x: 89
        'y': 346
      is_null:
        x: 234
        'y': 124
        navigate:
          7779f057-b4cd-77c9-accd-dc93ad50b5c4:
            targetId: cb99355c-c214-5fe2-5f25-a6932d94e899
            port: IS_NULL
      compare_numbers:
        x: 568
        'y': 115
        navigate:
          32a42491-4a30-88f9-82c7-ef5794c396ab:
            targetId: cb99355c-c214-5fe2-5f25-a6932d94e899
            port: GREATER_THAN
          6215b5e8-809d-0af9-d818-a78b3c2b2341:
            targetId: cb99355c-c214-5fe2-5f25-a6932d94e899
            port: LESS_THAN
      get_oo_flow_execution_status:
        x: 713.4000244140625
        'y': 118.60000610351562
        navigate:
          63b1b665-5809-172e-38c4-6aadc375da4a:
            targetId: 664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a
            port: SUCCESS
    results:
      FAILURE:
        cb99355c-c214-5fe2-5f25-a6932d94e899:
          x: 233
          'y': 328
      SUCCESS:
        664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a:
          x: 839
          'y': 120
