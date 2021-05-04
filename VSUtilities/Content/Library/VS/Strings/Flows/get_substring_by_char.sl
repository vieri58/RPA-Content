namespace: VS.Strings.Flows
flow:
  name: get_substring_by_char
  inputs:
    - input_string
    - char_to_find
  workflow:
    - get_char_position:
        do:
          VS.Strings.Actions.get_char_position:
            - input_string: '${input_string}'
            - char_to_find: '${char_to_find}'
        publish:
          - error_message
          - char_index
        navigate:
          - SUCCESS: substring
    - substring:
        do:
          io.cloudslang.base.strings.substring:
            - origin_string: '${input_string}'
            - end_index: '${char_index}'
        publish:
          - new_string
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - substring: '${new_string}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      get_char_position:
        x: 100
        'y': 150
      substring:
        x: 400
        'y': 150
        navigate:
          31efb2af-c474-3c73-8c6d-22f63edb78a5:
            targetId: e3799699-4a1b-04f9-5dcb-4e56f9d65e02
            port: SUCCESS
    results:
      SUCCESS:
        e3799699-4a1b-04f9-5dcb-4e56f9d65e02:
          x: 700
          'y': 150
