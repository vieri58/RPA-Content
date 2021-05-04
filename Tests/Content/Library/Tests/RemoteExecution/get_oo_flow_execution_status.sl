namespace: Tests.RemoteExecution
flow:
  name: get_oo_flow_execution_status
  inputs:
    - oo_central
    - oo_password:
        sensitive: true
    - oo_port
    - oo_run_id
    - oo_user:
        sensitive: true
  workflow:
    - base64_encoder:
        do:
          io.cloudslang.base.utils.base64_encoder:
            - data: "${oo_user+':'+oo_password}"
            - character_set: ''
        publish:
          - encodedString: '${result}'
        navigate:
          - SUCCESS: get_execution_status
          - FAILURE: on_failure
    - get_execution_status:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: "${'https://'+ oo_central +':'+ oo_port +'/oo/rest/v2/executions/'+ oo_run_id + '/summary'}"
            - username: '${oo_user}'
            - password:
                value: '${oo_password}'
                sensitive: true
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
            - headers: '${"Authorization: Basic "+ encodedString}'
            - content_type: application/json
        publish:
          - result_status: "${str(cs_json_query(return_result.strip('[]'),'resultStatusName')).strip('[\"]')}"
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
          - EQUALS: is_running
          - LESS_THAN: FAILURE
    - is_running:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${flow_status}'
            - second_string: running
            - ignore_case: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: is_completed
    - is_completed:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${flow_status}'
            - second_string: completed
            - ignore_case: 'true'
        navigate:
          - SUCCESS: is_success
          - FAILURE: FAILURE
    - is_success:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${result_status}'
            - second_string: success
            - ignore_case: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: FAILURE
  outputs:
    - oo_flow_status: '${flow_status}'
    - result_status: '${result_status}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      base64_encoder:
        x: 87
        'y': 35
      get_execution_status:
        x: 82
        'y': 220
      is_status_200:
        x: 247
        'y': 37
        navigate:
          90186867-679a-0401-7ee8-80db5ae96003:
            targetId: d251a4e1-e230-dd1e-37d1-767d3cc63cf0
            port: GREATER_THAN
          5807ee9b-5b4a-2b52-8719-b893aa6ed1e9:
            targetId: d251a4e1-e230-dd1e-37d1-767d3cc63cf0
            port: LESS_THAN
      is_running:
        x: 479
        'y': 45
        navigate:
          40364cf3-0aa7-d6e4-e5e6-db5e438b4995:
            targetId: 08f6f4c3-8a73-f449-65c6-ff40fce79846
            port: SUCCESS
      is_completed:
        x: 474
        'y': 235
        navigate:
          27cec2d8-5a61-782e-3158-add8a599385e:
            targetId: d251a4e1-e230-dd1e-37d1-767d3cc63cf0
            port: FAILURE
      is_success:
        x: 670
        'y': 246
        navigate:
          e16974a7-f7ee-550c-bd9b-d0474d4995ce:
            targetId: 08f6f4c3-8a73-f449-65c6-ff40fce79846
            port: SUCCESS
          9ac2cd93-9a41-2222-3ebf-6a8bb0e00db9:
            targetId: 83d1774a-69f3-c367-be86-ea3785d95894
            port: FAILURE
    results:
      FAILURE:
        d251a4e1-e230-dd1e-37d1-767d3cc63cf0:
          x: 238
          'y': 230
        83d1774a-69f3-c367-be86-ea3785d95894:
          x: 665
          'y': 402
      SUCCESS:
        08f6f4c3-8a73-f449-65c6-ff40fce79846:
          x: 667
          'y': 56
