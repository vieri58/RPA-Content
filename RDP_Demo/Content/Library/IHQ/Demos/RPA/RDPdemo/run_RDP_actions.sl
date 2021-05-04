namespace: IHQ.Demos.RPA.RDPdemo
flow:
  name: run_RDP_actions
  inputs:
    - configLine1: entry1
    - configLine2: entry2
  workflow:
    - act_rdp_actions:
        do:
          IHQ.Demos.RPA.RDPdemo.act_rdp_actions:
            - configLine1: '${configLine1}'
            - configLine2: '${configLine2}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      act_rdp_actions:
        x: 100
        'y': 150
        navigate:
          ba8e7644-e0cc-a171-dda9-75ca19299ee1:
            targetId: 420362f9-632b-594a-7a33-0b159bbc5fc5
            port: SUCCESS
          7a7ccfcc-05d4-6d68-224d-9654c0298817:
            targetId: 420362f9-632b-594a-7a33-0b159bbc5fc5
            port: WARNING
    results:
      SUCCESS:
        420362f9-632b-594a-7a33-0b159bbc5fc5:
          x: 400
          'y': 150
