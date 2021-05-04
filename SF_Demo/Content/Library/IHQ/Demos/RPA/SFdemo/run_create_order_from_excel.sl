namespace: IHQ.Demos.RPA.SFdemo
flow:
  name: run_create_order_from_excel
  inputs:
    - sourceFile: "F:\\RPA\\Use cases\\Read from Excel via OCR\\SFinvoice.xlsx"
  workflow:
    - act_get_excel_data_1:
        do:
          IHQ.Demos.RPA.SFdemo.act_get_excel_data: []
        publish:
          - customerName: '${customerNameValue}'
          - contractNumber: '${contractNumberValue}'
          - description: '${descriptionValue}'
        navigate:
          - SUCCESS: run_create_order
          - WARNING: run_create_order
          - FAILURE: on_failure
    - run_create_order:
        do:
          IHQ.Demos.RPA.SFdemo.run_create_order:
            - customerName: '${customerName}'
            - contractNumber: '${contractNumber}'
            - description: '${description}'
        publish:
          - order_number
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS
  outputs:
    - orderNumber: '${order_number}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      act_get_excel_data_1:
        x: 95
        'y': 163
      run_create_order:
        x: 253
        'y': 153
        navigate:
          0156db54-92c7-1c3c-5553-ac86a1874226:
            targetId: 2234eefb-0036-87da-6d06-c9ada777219a
            port: SUCCESS
    results:
      SUCCESS:
        2234eefb-0036-87da-6d06-c9ada777219a:
          x: 400
          'y': 150
