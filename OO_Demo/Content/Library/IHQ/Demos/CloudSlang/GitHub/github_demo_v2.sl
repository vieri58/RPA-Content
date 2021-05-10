namespace: IHQ.Demos.CloudSlang.GitHub
flow:
  name: github_demo_v2
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
