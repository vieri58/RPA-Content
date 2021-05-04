namespace: Tests.CloudSlang
flow:
  name: aggregate_loop_output_1
  workflow:
    - initialize_output:
        do:
          io.cloudslang.base.utils.do_nothing: []
        publish:
          - output_list: ''
        navigate:
          - SUCCESS: do_nothing
          - FAILURE: on_failure
    - do_nothing:
        loop:
          for: "item in 'a,b,c,d,e'"
          do:
            io.cloudslang.base.utils.do_nothing:
              - output_list: '${output_list}'
              - item: '${item}'
          break:
            - FAILURE
          publish:
            - output_list: '${output_list+","+item.upper()}'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - outputs: '${output_list}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      do_nothing:
        x: 246
        'y': 115
        navigate:
          226ff8ef-43a3-7695-bbad-b15dd6d97a94:
            targetId: 6095b7ca-756b-9b4b-216e-f6307e39e8c2
            port: SUCCESS
      initialize_output:
        x: 79
        'y': 154
    results:
      SUCCESS:
        6095b7ca-756b-9b4b-216e-f6307e39e8c2:
          x: 400
          'y': 150
