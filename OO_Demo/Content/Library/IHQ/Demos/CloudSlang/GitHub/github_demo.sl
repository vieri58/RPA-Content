namespace: IHQ.Demos.CloudSlang.GitHub
flow:
  name: github_demo
  workflow:
    - do_nothing:
        do:
          io.cloudslang.base.utils.do_nothing: []
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      do_nothing:
        x: 171.60000610351562
        'y': 122.60000610351562
        navigate:
          f00f3406-4064-bfdf-d410-8f10c9c63198:
            targetId: 55636dfb-5aeb-ea27-3678-2c4c966fcea8
            port: SUCCESS
    results:
      SUCCESS:
        55636dfb-5aeb-ea27-3678-2c4c966fcea8:
          x: 365.1999816894531
          'y': 74.60000610351562
