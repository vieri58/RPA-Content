namespace: IHQ.Demos.CloudSlang.Triaging
flow:
  name: Create_Temp_Data
  inputs:
    - host:
        prompt:
          type: text
        default: 10.10.30.182
  workflow:
    - create_temp_data:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: |-
                cd /tmp
                mkdir tempdir
                cd tempdir
                dd if=/dev/zero of=file bs=1024 count=1000000
            - username: "${get_sp('CloudSlang.linuxAdminUser')}"
            - password:
                value: "${get_sp('CloudSlang.linuxAdminPassword')}"
                sensitive: true
            - close_session: 'True'
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      create_temp_data:
        x: 100
        'y': 150
        navigate:
          6b78ec88-60eb-7d52-8203-9d266d30a995:
            targetId: 72b5bb2a-2531-6fc8-0220-7123a1cabd09
            port: SUCCESS
    results:
      SUCCESS:
        72b5bb2a-2531-6fc8-0220-7123a1cabd09:
          x: 400
          'y': 150
