namespace: IHQ.Demos.CloudSlang.VM_Lifecycle
flow:
  name: Deploy_VM_from_Template
  inputs:
    - templateName:
        default: rhel71x64
  workflow:
    - generate_VM_Name:
        do:
          io.cloudslang.base.utils.uuid_generator: []
        publish:
          - vmName: '${cs_regex(new_uuid,"^[^-]*")}'
        navigate:
          - SUCCESS: clone_vm
    - clone_vm:
        do:
          io.cloudslang.vmware.vcenter.vm.clone_vm:
            - host: "${get_sp('CloudSlang.vCenter')}"
            - user: "${get_sp('CloudSlang.vcenterAdminUsername')}"
            - password:
                value: "${get_sp('CloudSlang.vcenterAdminPassword')}"
                sensitive: true
            - port: "${get_sp('CloudSlang.vcenterPort')}"
            - protocol: "${get_sp('CloudSlang.vcenterProtocol')}"
            - vm_source_identifier: name
            - vm_source: '${templateName}'
            - datacenter: "${get_sp('CloudSlang.vcenterDatacenter')}"
            - vm_name: '${vmName}'
            - vm_folder: "${get_sp('CloudSlang.vcenterVmFolder')}"
            - cluster_name: "${get_sp('CloudSlang.vcenterClusterName')}"
            - mark_as_template: 'false'
            - thin_provision: 'true'
            - x_509_hostname_verifier: allow_all
            - trust_keystore: "${get_sp('CloudSlang.trustKeystore')}"
            - trust_password:
                value: "${get_sp('CloudSlang.trustPassword')}"
                sensitive: true
        publish:
          - vm_name
          - vm_folder
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  outputs:
    - vmName: '${vm_name}'
    - vmFolder: '${vm_folder}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      generate_VM_Name:
        x: 100
        'y': 150
      clone_vm:
        x: 400
        'y': 150
        navigate:
          b1680a15-95ab-1d8c-a80b-ca3ffb8764b2:
            targetId: d4387b9d-1555-f958-4811-2b80d5fc7102
            port: SUCCESS
    results:
      SUCCESS:
        d4387b9d-1555-f958-4811-2b80d5fc7102:
          x: 700
          'y': 150
