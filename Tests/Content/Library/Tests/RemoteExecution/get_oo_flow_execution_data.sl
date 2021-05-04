namespace: Tests.RemoteExecution
flow:
  name: get_oo_flow_execution_data
  inputs:
    - oo_central: rpa2.csademo.hpeswlab.net
    - oo_password:
        default: Admin@123
        sensitive: true
    - oo_port: '8443'
    - oo_run_id: '116800939'
    - oo_user:
        default: vieri
        sensitive: true
    - output: number
  workflow:
    - base64_encoder:
        do:
          io.cloudslang.base.utils.base64_encoder:
            - data: "${oo_user+':'+oo_password}"
            - character_set: ''
        publish:
          - encodedString: '${result}'
        navigate:
          - SUCCESS: get_execution_data
          - FAILURE: on_failure
    - get_execution_data:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: "${'https://'+ oo_central +':'+ oo_port +'/oo/rest/v2/executions/'+ oo_run_id + '/execution-log'}"
            - username: '${oo_user}'
            - password:
                value: '${oo_password}'
                sensitive: true
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - headers: '${"Authorization: Basic "+ encodedString}'
            - content_type: application/json
            - output: '${output}'
        publish:
          - output_value: "${cs_json_query(str(cs_json_query(return_result,\"flowOutput\")).strip('[]'),output).strip('[\"]')}"
          - status_code
          - flow_status: "${str(cs_json_query(return_result.strip('[]'),'status')).strip('[\"]')}"
        navigate:
          - SUCCESS: is_status_200
          - FAILURE: on_failure
    - is_status_200:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${status_code}'
            - value2: '200'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: SUCCESS
          - LESS_THAN: FAILURE
  outputs:
    - output_value: '${output_value}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      base64_encoder:
        x: 100
        'y': 250
      get_execution_data:
        x: 400
        'y': 250
      is_status_200:
        x: 700
        'y': 250
        navigate:
          eff66d00-9bc6-5d05-cb94-333bc6708e6a:
            targetId: 85fd4ae3-6691-13c4-4020-1d3c67524ed5
            port: GREATER_THAN
          a7306a08-c938-418b-582f-40c431aa3699:
            targetId: d31f0bce-13bc-e4e6-c9ca-922dfd509a08
            port: EQUALS
          3e4f98a2-861a-c933-f1ee-a3b49efde83b:
            targetId: 85fd4ae3-6691-13c4-4020-1d3c67524ed5
            port: LESS_THAN
    results:
      FAILURE:
        85fd4ae3-6691-13c4-4020-1d3c67524ed5:
          x: 1000
          'y': 375
      SUCCESS:
        d31f0bce-13bc-e4e6-c9ca-922dfd509a08:
          x: 1000
          'y': 125
