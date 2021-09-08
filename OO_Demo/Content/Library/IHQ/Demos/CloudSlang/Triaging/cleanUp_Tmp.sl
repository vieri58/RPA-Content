namespace: IHQ.Demos.CloudSlang.Triaging
flow:
  name: cleanUp_Tmp
  inputs:
    - host:
        prompt:
          type: text
        default: 10.10.30.182
  workflow:
    - get_disk_space_before:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: df -h /tmp
            - username: "${get_sp('CloudSlang.linuxAdminUser')}"
            - password:
                value: "${get_sp('CloudSlang.linuxAdminPassword')}"
                sensitive: true
            - close_session: 'True'
        publish:
          - diskSpaceBefore: "${cs_extract_number(cs_regex(cs_substring(cs_substring(standard_out,49,),10,),'\\d+G(?!.*\\d+G)'),1)}"
        navigate:
          - SUCCESS: cleanUp_Temp_Data
          - FAILURE: on_failure
    - cleanUp_Temp_Data:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: rm -rf /tmp/tempdir
            - username: "${get_sp('CloudSlang.linuxAdminUser')}"
            - password:
                value: "${get_sp('CloudSlang.linuxAdminPassword')}"
                sensitive: true
            - close_session: 'True'
        navigate:
          - SUCCESS: get_disk_space_after
          - FAILURE: on_failure
    - get_disk_space_after:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: df -h /tmp
            - username: "${get_sp('CloudSlang.linuxAdminUser')}"
            - password:
                value: "${get_sp('CloudSlang.linuxAdminPassword')}"
                sensitive: true
            - close_session: 'True'
        publish:
          - diskSpaceAfter: "${cs_extract_number(cs_regex(cs_substring(cs_substring(standard_out,49,),10,),'\\d+G(?!.*\\d+G)'),1)}"
        navigate:
          - SUCCESS: compare_numbers
          - FAILURE: on_failure
    - compare_numbers:
        do:
          io.cloudslang.base.math.compare_numbers:
            - value1: '${diskSpaceAfter}'
            - value2: '${diskSpaceBefore}'
        publish: []
        navigate:
          - GREATER_THAN: SUCCESS
          - EQUALS: FAILURE
          - LESS_THAN: FAILURE
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_disk_space_before:
        x: 98
        'y': 250
      cleanUp_Temp_Data:
        x: 400
        'y': 250
      get_disk_space_after:
        x: 700
        'y': 250
      compare_numbers:
        x: 1000
        'y': 250
        navigate:
          a51be5ef-6e40-51ce-e263-60664728c509:
            targetId: 8863934a-1c74-5044-6376-1e8f7c1f6616
            port: GREATER_THAN
          ee27556c-ec78-6bdd-be71-cfb1c099e30f:
            targetId: 0f842f2c-2518-a0dc-ebd9-6b36ee29f583
            port: EQUALS
          7a361914-c771-4dc5-296b-7c30c7930490:
            targetId: 0f842f2c-2518-a0dc-ebd9-6b36ee29f583
            port: LESS_THAN
    results:
      FAILURE:
        0f842f2c-2518-a0dc-ebd9-6b36ee29f583:
          x: 1300
          'y': 375
      SUCCESS:
        8863934a-1c74-5044-6376-1e8f7c1f6616:
          x: 1300
          'y': 125
