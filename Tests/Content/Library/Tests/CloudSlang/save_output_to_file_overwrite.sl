namespace: Tests.CloudSlang
flow:
  name: save_output_to_file_overwrite
  workflow:
    - random_number_generator:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '10'
            - max: '50'
            - numbers: '0'
        publish:
          - random_number: '${str(random_number)}'
        navigate:
          - SUCCESS: write_to_file
          - FAILURE: on_failure
    - write_to_file:
        do:
          io.cloudslang.base.filesystem.write_to_file:
            - file_path: "C:\\Temp\\results.txt"
            - text: '${random_number}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      random_number_generator:
        x: 100
        'y': 150
      write_to_file:
        x: 332.6000061035156
        'y': 155.60000610351562
        navigate:
          f6f02d95-86a1-c48a-876e-9b11c30234d3:
            targetId: 6a983f3a-655e-166a-c928-87841e2be854
            port: SUCCESS
    results:
      SUCCESS:
        6a983f3a-655e-166a-c928-87841e2be854:
          x: 700
          'y': 150
