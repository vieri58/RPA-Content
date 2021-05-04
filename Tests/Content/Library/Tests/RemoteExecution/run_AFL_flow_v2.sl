namespace: Tests.RemoteExecution
flow:
  name: run_AFL_flow_v2
  inputs:
    - flow_uuid:
        prompt:
          type: text
        default: 06fe8531-868b-4e79-aa7a-13a5e30a66ec
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
        default: 'min,max'
    - values:
        prompt:
          type: text
        default: '1,100'
  workflow:
    - base64_encoder:
        do:
          io.cloudslang.base.utils.base64_encoder:
            - data: "${oo_user+':'+oo_password}"
            - character_set: ''
        publish:
          - encodedString: '${result}'
        navigate:
          - SUCCESS: create_input_json_beautified
          - FAILURE: on_failure
    - run_oo_flow:
        do:
          io.cloudslang.base.http.http_client_post:
            - url: "${'https://'+oo_central+':'+oo_port+'/oo/rest/v2/executions'}"
            - auth_type: basic
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - headers: '${"Authorization: Basic "+ encodedString}'
            - body: "${'{ \\\n\"flowUuid\":\"'+ flow_uuid +'\",' \\\n'\"runName\":\"'+ run_name + '\",'\\\n'\"logLevel\":\"STANDARD\",' + \\\ninputs_json + '\\n'\\\n'}'}"
            - content_type: application/json
        publish:
          - run_id: '${return_result}'
          - error_message
          - return_code
          - status_code
          - response_headers
        navigate:
          - SUCCESS: get_oo_flow_execution_status
          - FAILURE: on_failure
    - is_null:
        do:
          io.cloudslang.base.utils.is_null:
            - variable: '${inputs_json}'
        publish: []
        navigate:
          - IS_NULL: FAILURE
          - IS_NOT_NULL: run_oo_flow
    - create_input_json_beautified:
        do:
          Tests.RemoteExecution.create_input_json_beautified:
            - inputs: '${inputs}'
            - values: '${values}'
        publish:
          - inputs_json
        navigate:
          - SUCCESS: is_null
    - get_oo_flow_execution_status:
        do:
          Tests.RemoteExecution.get_oo_flow_execution_status:
            - oo_central: '${oo_central}'
            - oo_password:
                value: '${oo_password}'
                sensitive: true
            - oo_port: '${oo_port}'
            - oo_run_id: '${run_id}'
            - oo_user:
                value: '${oo_user}'
                sensitive: true
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
        x: 100
        'y': 250
      create_input_json_beautified:
        x: 377
        'y': 257
      is_null:
        x: 700
        'y': 250
        navigate:
          59b33bf5-46e3-8aa7-817a-a523ad52abd8:
            targetId: ff484123-b791-46fb-dedf-6382bf4f74b5
            port: IS_NULL
      run_oo_flow:
        x: 1000
        'y': 375
      get_oo_flow_execution_status:
        x: 1137.800048828125
        'y': 370.20001220703125
        navigate:
          79a144a8-8592-ae1b-8ed8-fcd351f4d552:
            targetId: 3e4a9458-7866-490c-e255-511841f031d1
            port: SUCCESS
    results:
      FAILURE:
        ff484123-b791-46fb-dedf-6382bf4f74b5:
          x: 1000
          'y': 125
      SUCCESS:
        3e4a9458-7866-490c-e255-511841f031d1:
          x: 1300
          'y': 250
