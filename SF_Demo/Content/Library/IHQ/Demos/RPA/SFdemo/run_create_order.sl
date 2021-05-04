namespace: IHQ.Demos.RPA.SFdemo
flow:
  name: run_create_order
  inputs:
    - customerName: Google
    - contractNumber: '102'
    - description: ordine demo
  workflow:
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
        x: 99
        'y': 150
        navigate:
          7e80a07b-d95e-9d2a-e75f-7456bacac6f3:
            targetId: 652ba8c0-5c75-86cb-fb54-53d9259b2080
            port: SUCCESS
          1bd83a8d-e0be-82ed-aca7-14a98ab19004:
            targetId: 652ba8c0-5c75-86cb-fb54-53d9259b2080
            port: WARNING
    results:
      SUCCESS:
        652ba8c0-5c75-86cb-fb54-53d9259b2080:
          x: 400
          'y': 150
