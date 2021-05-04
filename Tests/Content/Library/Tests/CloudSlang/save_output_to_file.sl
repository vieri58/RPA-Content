namespace: Tests.CloudSlang
flow:
  name: save_output_to_file
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
          - SUCCESS: write_to_file_append
          - FAILURE: on_failure
    - write_to_file_append:
        do:
          VS.Filesystem.write_to_file_append:
            - file_path: "C:\\Temp\\results.txt"
            - text: '${random_number}'
        publish:
          - res
          - message
          - file_path
        navigate:
          - SUCCESS: SUCCESS
  outputs:
    - file_path: '${file_path}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      random_number_generator:
        x: 100
        'y': 150
      write_to_file_append:
        x: 400
        'y': 150
        navigate:
          ae4d3446-a14b-317e-026a-10871264ff6f:
            targetId: 6a983f3a-655e-166a-c928-87841e2be854
            port: SUCCESS
    results:
      SUCCESS:
        6a983f3a-655e-166a-c928-87841e2be854:
          x: 700
          'y': 150
