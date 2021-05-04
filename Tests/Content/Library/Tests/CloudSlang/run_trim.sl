namespace: Tests.CloudSlang
flow:
  name: run_trim
  inputs:
    - flow_input_0:
        prompt:
          type: text
        default: '   abc_d  '
  workflow:
    - trim:
        do:
          io.cloudslang.base.strings.trim:
            - origin_string: '${flow_input_0}'
        publish:
          - new_string
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      trim:
        x: 100
        'y': 150
        navigate:
          75d0c1cb-371d-5728-04b2-1ab632e2a3aa:
            targetId: d1dc393f-7365-e5bc-7e89-6699c2c68927
            port: SUCCESS
    results:
      SUCCESS:
        d1dc393f-7365-e5bc-7e89-6699c2c68927:
          x: 400
          'y': 150
