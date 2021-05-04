namespace: Tests.CloudSlang
flow:
  name: generate_random_number
  workflow:
    - random_number_generator:
        do:
          io.cloudslang.base.math.random_number_generator:
            - min: '1'
            - max: '100'
        publish:
          - random_number
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - number: '${random_number}'
    - random_number: '${random_number}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      random_number_generator:
        x: 167.79998779296875
        'y': 150.93333435058594
        navigate:
          ddb382e7-2176-437a-e8b8-2029adb1aeea:
            targetId: 1e11b1cb-e2a4-c5d9-5e39-49fc8e2ff3c9
            port: SUCCESS
    results:
      SUCCESS:
        1e11b1cb-e2a4-c5d9-5e39-49fc8e2ff3c9:
          x: 313
          'y': 152
