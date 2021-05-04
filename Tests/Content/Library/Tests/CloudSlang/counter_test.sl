namespace: Tests.CloudSlang
flow:
  name: counter_test
  inputs:
    - start: '1'
    - end: '15'
    - step: '2'
  workflow:
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: counter
          - FAILURE: on_failure
    - counter:
        do:
          VS.Looping.counter:
            - start: '${start}'
            - end: '${end}'
            - step: '${step}'
        publish:
          - start: '${result}'
        navigate:
          - GREATER_THAN: FAILURE
          - EQUALS: SUCCESS
          - LESS_THAN: do_nothing
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      do_nothing:
        x: 360.79998779296875
        'y': 100.80000305175781
      counter:
        x: 102.79998779296875
        'y': 125.80000305175781
        navigate:
          68d1cf97-980e-637f-58ef-ce8c9d35efc8:
            targetId: 5fdb6c30-e164-3dcb-527e-784432d5ecb6
            port: GREATER_THAN
          0d605a18-9ae3-d17f-c9ff-1871ae615512:
            targetId: d52474b6-c33b-e0e4-974b-4d9454dd656b
            port: EQUALS
    results:
      FAILURE:
        5fdb6c30-e164-3dcb-527e-784432d5ecb6:
          x: 91.26666259765625
          'y': 254.566650390625
      SUCCESS:
        d52474b6-c33b-e0e4-974b-4d9454dd656b:
          x: 244
          'y': 255
