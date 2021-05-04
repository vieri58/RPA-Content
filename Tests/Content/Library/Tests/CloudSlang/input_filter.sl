namespace: Tests.CloudSlang
flow:
  name: input_filter
  inputs:
    - flow_input_0:
        prompt:
          type: text
        default: abcdefgh_c
  workflow:
    - substring:
        do:
          io.cloudslang.base.strings.substring:
            - origin_string: '${flow_input_0:-2}'
            - end_index: '2'
        publish:
          - new_string
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - newString: '${new_string}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      substring:
        x: 100
        'y': 150
        navigate:
          f33b31d6-919c-90e9-84f8-d0b14532c950:
            targetId: 5baac8de-0726-3625-44c5-c49a4321a8eb
            port: SUCCESS
    results:
      SUCCESS:
        5baac8de-0726-3625-44c5-c49a4321a8eb:
          x: 400
          'y': 150
