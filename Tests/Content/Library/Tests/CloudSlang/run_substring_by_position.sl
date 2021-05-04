namespace: Tests.CloudSlang
flow:
  name: run_substring_by_position
  inputs:
    - flow_input_0:
        prompt:
          type: text
        default: '0123456789'
  workflow:
    - substring:
        do:
          io.cloudslang.base.strings.substring:
            - origin_string: '${flow_input_0}'
            - end_index: '5'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      substring:
        x: 335
        'y': 120
        navigate:
          c315cde5-dc67-c350-7bbe-47d7876f0bae:
            targetId: 88b0f8d8-a063-b7c8-79ab-84366c547fa4
            port: SUCCESS
    results:
      SUCCESS:
        88b0f8d8-a063-b7c8-79ab-84366c547fa4:
          x: 591
          'y': 116
