namespace: Tests.CloudSlang
flow:
  name: run_read_excel
  inputs:
    - customerName:
        default: Google_c
    - contractNumber: '102'
    - description: ordine demo
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: "C:\\Use cases\\order_data.xlsx"
            - worksheet_name: orders
        publish:
          - data: '${return_result}'
          - header
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - order_number: '${order_number}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_cell:
        x: 90
        'y': 145
        navigate:
          d06e7566-50f0-44d3-d53a-9d9f0704b362:
            targetId: 652ba8c0-5c75-86cb-fb54-53d9259b2080
            port: SUCCESS
    results:
      SUCCESS:
        652ba8c0-5c75-86cb-fb54-53d9259b2080:
          x: 586
          'y': 153
