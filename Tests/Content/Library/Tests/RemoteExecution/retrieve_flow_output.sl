namespace: Tests.RemoteExecution
flow:
  name: retrieve_flow_output
  inputs:
    - oo_central:
        default: rpa2.csademo.hpeswlab.net
    - oo_password:
        default: Admin@123
        sensitive: true
    - oo_port: '8443'
    - oo_user:
        default: vieri
        sensitive: true
    - oo_run_id
    - output
  workflow:
    - get_oo_flow_execution_data:
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
          - result_status
        navigate:
          - FAILURE: on_failure
          - SUCCESS: is_running
    - is_running:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${oo_flow_status}'
            - second_string: running
            - ignore_case: 'true'
        navigate:
          - SUCCESS: get_oo_flow_execution_data
          - FAILURE: is_completed
    - is_completed:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${oo_flow_status}'
            - second_string: completed
            - ignore_case: 'true'
        navigate:
          - SUCCESS: is_success
          - FAILURE: on_failure
    - is_success:
        do:
          io.cloudslang.base.strings.string_equals:
            - first_string: '${result_status}'
            - second_string: success
            - ignore_case: 'true'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      is_success:
        x: 743
        'y': 317
        navigate:
          6a847861-eb08-d86e-090c-55d33991e451:
            targetId: 664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a
            port: SUCCESS
      is_completed:
        x: 529
        'y': 319
      is_running:
        x: 524
        'y': 104
      get_oo_flow_execution_data:
        x: 345
        'y': 104
    results:
      SUCCESS:
        664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a:
          x: 927
          'y': 311
