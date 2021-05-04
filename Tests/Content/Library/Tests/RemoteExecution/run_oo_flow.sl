namespace: Tests.RemoteExecution
flow:
  name: run_oo_flow
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
        default: sleep test
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
    - launch_oo_flow:
        do:
          Tests.RemoteExecution.launch_oo_flow:
            - flow_uuid: '${flow_uuid}'
        publish:
          - oo_run_id
        navigate:
          - FAILURE: on_failure
          - SUCCESS: wait_for_oo_flow
    - wait_for_oo_flow:
        loop:
          for: 'i in range(0,720,1)'
          do:
            Tests.RemoteExecution.wait_for_oo_flow:
              - oo_central: '${oo_central}'
              - oo_password:
                  value: '${oo_password}'
                  sensitive: true
              - oo_port: '${oo_port}'
              - oo_user:
                  value: '${oo_user}'
                  sensitive: true
              - oo_run_id: '${oo_run_id}'
          break:
            - SUCCESS
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - oo_run_id
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      launch_oo_flow:
        x: 58.79998779296875
        'y': 126.80000305175781
      wait_for_oo_flow:
        x: 218
        'y': 127
        navigate:
          ee398aa9-0821-1962-318a-eea51e631381:
            targetId: 664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a
            port: SUCCESS
    results:
      SUCCESS:
        664aa182-ae4a-b6d9-d7cb-70b1eb1ee64a:
          x: 348
          'y': 124
