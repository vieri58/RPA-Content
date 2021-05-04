namespace: Tests.CloudSlang
flow:
  name: AFL_counter_test
  inputs:
    - start
    - end
    - step
  workflow:
    - Counter:
        do_external:
          c62eeb58-f329-4ae3-b336-54bdc5c9f3d6:
            - from: '${start}'
            - to: '${end}'
            - incrementBy: '1'
        publish:
          - result
        navigate:
          - has more: do_nothing
          - no more: FAILURE
          - failure: FAILURE
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: Counter
          - FAILURE: on_failure
  results:
    - FAILURE
extensions:
  graph:
    steps:
      Counter:
        x: 65
        'y': 106
        navigate:
          e72e7165-91ce-8034-f90a-d449de8c9060:
            targetId: df8d0b03-44a4-ba08-8966-f00f5fa63979
            port: no more
          3c90aab3-6b76-4079-4b84-f99ad97df0cc:
            targetId: df8d0b03-44a4-ba08-8966-f00f5fa63979
            port: failure
      do_nothing:
        x: 357
        'y': 128
    results:
      FAILURE:
        df8d0b03-44a4-ba08-8966-f00f5fa63979:
          x: 84
          'y': 278
