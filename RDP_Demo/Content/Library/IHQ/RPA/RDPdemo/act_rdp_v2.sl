namespace: IHQ.RPA.RDPdemo
operation:
  name: act_rdp_v2
  sequential_action:
    gav: 'com.microfocus.seq:IHQ.RPA.RDPdemo.act_rdp_v2:1.0.0'
    skills:
      - Java
      - SAP NWBC Desktop
      - SAP
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - Terminal Emulators
      - UI Automation
      - Web
      - WPF
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: false
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: SystemUtil
          action: Run
          args: "\"C:\\Windows\\System32\\mstsc.exe\", \"E:\\ATM\\rdp_test.rdp\""
      - step:
          id: '2'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject")'
          action: Click
          highlight_id: '6'
      - step:
          id: '3'
          object_path: 'Window("Remote Desktop Connection")'
          action: close
          highlight_id: '10'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
