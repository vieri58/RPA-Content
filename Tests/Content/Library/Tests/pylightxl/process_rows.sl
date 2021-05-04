namespace: Tests.pylightxl
flow:
  name: process_rows
  inputs:
    - file_path:
        prompt:
          type: text
        default: 'C:/Use cases/order_data.xlsx'
    - worksheet:
        prompt:
          type: text
        default: orders
  workflow:
    - get_row_number_1:
        do:
          Tests.pylightxl.get_row_number:
            - file_path: '${file_path}'
            - ws: '${worksheet}'
        publish:
          - num_rows
        navigate:
          - SUCCESS: read_row_1
    - read_row_1:
        loop:
          for: 'row in range(2,int(num_rows)+1)'
          do:
            Tests.pylightxl.read_row:
              - file_path: '${file_path}'
              - ws: '${worksheet}'
              - row: '${row}'
          break: []
          publish:
            - row_content
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - num_rows: '${num_rows}'
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      get_row_number_1:
        x: 92
        'y': 143
      read_row_1:
        x: 241
        'y': 155
        navigate:
          f36ddc12-39ef-781b-d0e5-2baaa0c1bf3a:
            targetId: e0fe350d-7d51-e200-e6e0-542891511df2
            port: SUCCESS
    results:
      SUCCESS:
        e0fe350d-7d51-e200-e6e0-542891511df2:
          x: 400
          'y': 150
