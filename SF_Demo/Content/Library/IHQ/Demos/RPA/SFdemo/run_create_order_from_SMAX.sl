namespace: IHQ.Demos.RPA.SFdemo
flow:
  name: run_create_order_from_SMAX
  inputs:
    - customerName:
        default: Google_c
    - contractNumber: '102'
    - description: ordine demo
  workflow:
    - get_substring_by_char:
        do:
          VS.Strings.Flows.get_substring_by_char:
            - input_string: '${customerName}'
            - char_to_find: _
        publish:
          - customerName: '${substring}'
        navigate:
          - SUCCESS: act_create_order
          - FAILURE: on_failure
    - act_create_order:
        robot_group: WEB
        do:
          IHQ.Demos.RPA.SFdemo.act_create_order:
            - customer_name: '${customerName}'
            - contract_number: '${contractNumber}'
            - description: '${description}'
        publish:
          - order_number
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - order_number: '${order_number}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      act_create_order:
        x: 284
        'y': 148
        navigate:
          7e80a07b-d95e-9d2a-e75f-7456bacac6f3:
            targetId: 652ba8c0-5c75-86cb-fb54-53d9259b2080
            port: SUCCESS
          1bd83a8d-e0be-82ed-aca7-14a98ab19004:
            targetId: 652ba8c0-5c75-86cb-fb54-53d9259b2080
            port: WARNING
      get_substring_by_char:
        x: 92
        'y': 152
    results:
      SUCCESS:
        652ba8c0-5c75-86cb-fb54-53d9259b2080:
          x: 586
          'y': 153
