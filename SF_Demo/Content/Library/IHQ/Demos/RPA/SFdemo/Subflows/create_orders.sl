namespace: IHQ.Demos.RPA.SFdemo.Subflows
flow:
  name: create_orders
  inputs:
    - customerName
    - contractNumber
    - description
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
    - file_path: '${file_path}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      act_create_order:
        x: 100
        'y': 150
        navigate:
          769f37c7-33fd-4f55-c63f-9138fd55cd1d:
            targetId: 194d251f-6356-a3c7-0090-d13a58810de1
            port: SUCCESS
          edc67700-a64d-d8a0-1786-cf9a9a7aad69:
            targetId: 194d251f-6356-a3c7-0090-d13a58810de1
            port: WARNING
    results:
      SUCCESS:
        194d251f-6356-a3c7-0090-d13a58810de1:
          x: 400
          'y': 150
