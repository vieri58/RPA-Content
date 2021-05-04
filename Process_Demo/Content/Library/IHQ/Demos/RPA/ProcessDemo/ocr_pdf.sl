namespace: IHQ.Demos.RPA.ProcessDemo
operation:
  name: ocr_pdf
  inputs:
    - pdf_path: "C:\\rpatemp\\invoice.pdf"
  sequential_action:
    gav: 'com.microfocus.seq:IHQ.Demos.RPA.ProcessDemo.ocr_pdf:1.0.0'
    external: true
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
        current_emulator: Rumba 7.5
      web:
        active: false
        address: 'http://advantageonlineshopping.com'
        browser: IE
        close_on_exit: true
  outputs:
    - order_number:
        robot: true
        value: '${order_number}'
    - first_name:
        robot: true
        value: '${first_name}'
    - last_name:
        robot: true
        value: '${last_name}'
    - ammount:
        robot: true
        value: '${ammount}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
