namespace: Tests.pylightxl
flow:
  name: read_excel_cell_by_pylightxl
  workflow:
    - read_excel_cell:
        do:
          Tests.pylightxl.read_excel_cell: []
        publish:
          - cell_value
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      read_excel_cell:
        x: 140
        'y': 179
        navigate:
          a97eac57-44ba-c8d0-a490-35552ca1c3ab:
            targetId: 82fe061d-8401-d64c-5ca3-61100b9d0d2d
            port: SUCCESS
    results:
      SUCCESS:
        82fe061d-8401-d64c-5ca3-61100b9d0d2d:
          x: 400
          'y': 150
