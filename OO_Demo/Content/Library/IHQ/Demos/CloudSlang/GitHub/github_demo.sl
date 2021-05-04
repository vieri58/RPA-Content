namespace: IHQ.Demos.CloudSlang.GitHub
flow:
  name: github_demo
  workflow:
    - Do_Nothing:
        do_external:
          ddd79f22-8b1e-4605-88d5-d912bb2da2b9: []
        navigate:
          - success: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      Do_Nothing:
        x: 159.60000610351562
        'y': 103
        navigate:
          7c0555fe-de6d-9635-c83a-299b2426e1ee:
            targetId: 55636dfb-5aeb-ea27-3678-2c4c966fcea8
            port: success
    results:
      SUCCESS:
        55636dfb-5aeb-ea27-3678-2c4c966fcea8:
          x: 365.1999816894531
          'y': 74.60000610351562
