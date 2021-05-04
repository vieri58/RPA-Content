namespace: Tests.RemoteExecution
flow:
  name: wait_for_oo_flow
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
  workflow:
    - counter:
        do:
          VS.Looping.counter:
            - start: '1'
            - end: '720'
            - step: '1'
        publish:
          - start: '${result}'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: wait_10_secs
          - LESS_THAN: wait_10_secs
    - wait_10_secs:
        do:
          io.cloudslang.base.utils.sleep:
            - seconds: '10'
        navigate:
          - SUCCESS: get_oo_flow_execution_status
          - FAILURE: on_failure
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
          - SUCCESS: counter
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
      wait_10_secs:
        x: 183
        'y': 102
      get_oo_flow_execution_status:
        x: 345
        'y': 104
      is_running:
        x: 524
        'y': 104
        navigate:
          d2b53aa0-fa3f-a3dd-7de0-ff207cdcc2ce:
            vertices:
              - x: 335
                'y': 66
            targetId: counter
            port: SUCCESS
      is_completed:
        x: 529
        'y': 319
      counter:
        x: 51
        'y': 109
        navigate:
          a64f08da-d7c5-24d4-35a2-9a7c25045ad5:
            targetId: 3359f34f-85a3-f780-5260-51c358d5eaf6
            port: GREATER_THAN
    results:
      SUCCESS:
        664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a:
          x: 927
          'y': 311
      FAILURE:
        3359f34f-85a3-f780-5260-51c358d5eaf6:
          x: 54
          'y': 254
