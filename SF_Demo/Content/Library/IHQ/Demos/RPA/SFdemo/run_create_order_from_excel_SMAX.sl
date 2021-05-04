namespace: IHQ.Demos.RPA.SFdemo
flow:
  name: run_create_order_from_excel_SMAX
  workflow:
    - get_cell:
        do:
          io.cloudslang.base.excel.get_cell:
            - excel_file_name: "C:\\Use cases\\order_data.xlsx"
            - worksheet_name: orders
        publish:
          - data: '${return_result}'
          - header
          - customerName_index: '${str(header.split(",").index("Customer"))}'
          - contractNumber_index: '${str(header.split(",").index("Contract Number"))}'
          - description_index: '${str(header.split(",").index("Description"))}'
        navigate:
          - SUCCESS: initialize_order_list
          - FAILURE: on_failure
    - initialize_order_list:
        do:
          io.cloudslang.base.utils.do_nothing: []
        publish:
          - order_list: ''
        navigate:
          - SUCCESS: act_create_order
          - FAILURE: on_failure
    - act_create_order:
        robot_group: WEB
        loop:
          for: 'row in data.split("|")'
          do:
            IHQ.Demos.RPA.SFdemo.act_create_order:
              - customer_name: '${row.split(",")[int(customerName_index)]}'
              - contract_number: '${str(int(float(row.split(",")[int(contractNumber_index)])))}'
              - description: '${row.split(",")[int(description_index)]}'
              - order_list: '${order_list}'
          break:
            - FAILURE
          publish:
            - order_list: '${str(order_list)+","+order_number}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  outputs:
    - orders: '${order_list[1:]}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_cell:
        x: 100
        'y': 150
      initialize_order_list:
        x: 400
        'y': 150
      act_create_order:
        x: 700
        'y': 151
        navigate:
          433bbfe2-59ec-48ee-79da-8b2ef75b2cf9:
            targetId: 9998ce15-1392-9ae4-0c99-f64779d80316
            port: SUCCESS
          0951ed4d-7520-3023-7fe5-45297ae7fa48:
            targetId: 9998ce15-1392-9ae4-0c99-f64779d80316
            port: WARNING
    results:
      SUCCESS:
        9998ce15-1392-9ae4-0c99-f64779d80316:
          x: 1000
          'y': 150
