namespace: IHQ.Demos.RPA.SFdemo
operation:
  name: act_get_excel_data
  inputs:
    - sourceFile: "F:\\RPA\\Use cases\\Read from Excel via OCR\\SFinvoice.xlsx"
  sequential_action:
    gav: 'com.microfocus.seq:IHQ.Demos.RPA.SFdemo.act_get_excel_data:1.0.17'
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
        active: true
        apps:
          app_1:
            args: ''
            directory: "C:\\Program Files\\Microsoft Office\\Office15"
            include_child_processes: true
            launch_application: true
            path: "C:\\Program Files\\Microsoft Office\\Office15\\EXCEL.EXE"
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
          object_path: 'UIAWindow("Excel").UIAHyperlink("Open Other Workbooks")'
          action: Click
      - step:
          id: '2'
          object_path: 'Window("Excel").WinObject("WinObject").WinMenu("WinMenu")'
          action: Select
          args: '"Computer"'
      - step:
          id: '3'
          object_path: 'Window("Excel").WinObject("WinObject").WinButton("Browse")'
          action: Click
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '2001300584'
      - step:
          id: '4'
          object_path: 'UIAWindow("Excel").UIAWindow("Open").UIAComboBox("File name:")'
          action: Select
          args: 'Parameter("sourceFile")'
      - step:
          id: '5'
          object_path: 'UIAWindow("Excel").UIAWindow("Open").UIASplitButton("Open")'
          action: Click
      - step:
          id: '6'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel")'
          action: Maximize
      - step:
          id: '7'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("B9")'
          action: Output
          args: 'CheckPoint("description")'
      - step:
          id: '8'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("C9")'
          action: Output
          args: 'CheckPoint("descriptionValue")'
      - step:
          id: '9'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("B10")'
          action: Output
          args: 'CheckPoint("customerName")'
      - step:
          id: '10'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("C10")'
          action: Output
          args: 'CheckPoint("customerNameValue")'
      - step:
          id: '11'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("B11")'
          action: Output
          args: 'CheckPoint("contractNumber")'
      - step:
          id: '12'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIATab("SFinvoice.xlsx").UIAObject("Sheet Sheet1").UIATable("Grid").UIAObject("C11")'
          action: Output
          args: 'CheckPoint("contractNumberValue")'
      - step:
          id: '13'
          object_path: 'UIAWindow("SFinvoice.xlsx - Excel").UIAButton("File Tab")'
          action: Click
      - step:
          id: '14'
          object_path: 'Window("Excel")'
          action: Close
  outputs:
    - description:
        robot: true
        value: '${description}'
    - descriptionValue:
        robot: true
        value: '${descriptionValue}'
    - customerName:
        robot: true
        value: '${customerName}'
    - customerNameValue:
        robot: true
        value: '${customerNameValue}'
    - contractNumber:
        robot: true
        value: '${contractNumber}'
    - contractNumberValue:
        robot: true
        value: '${contractNumberValue}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: Excel
        child_objects:
          - object:
              smart_identification: ''
              name: WinObject
              child_objects:
                - object:
                    smart_identification: ''
                    name: WinMenu
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: '2'
                            regular_expression: false
                          name: menuobjtype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: Open
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: WinMenu
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - menuobjtype
                        - acc_name
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Open Other Workbooks
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: link
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Open Other Workbooks
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: link
                        name: simclass
                        type: STRING
                    class: WinButton
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - text
                        - nativeclass
                        - acc_name
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: Browse
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: push button
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Browse
                            regular_expression: false
                          name: acc_name
                          hidden: false
                          read_only: false
                          type: STRING
                    comments: ''
                    custom_replay:
                      behavior:
                        value: push button
                        name: simclass
                        type: STRING
                    class: WinButton
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - text
                        - nativeclass
                        - acc_name
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: NetUIHWND
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: ''
                      regular_expression: false
                    name: acc_name
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: window
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - regexpwndclass
                  - acc_name
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Excel
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: XLMAIN
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: XLMAIN
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: SFinvoice.xlsx - Excel
        child_objects:
          - object:
              smart_identification: ''
              name: SFinvoice.xlsx
              child_objects:
                - object:
                    smart_identification: ''
                    name: Sheet Sheet1
                    child_objects:
                      - object:
                          smart_identification: ''
                          name: Grid
                          child_objects:
                            - object:
                                smart_identification: ''
                                name: C9
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:C9'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: C9
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                            - object:
                                smart_identification: ''
                                name: C11
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:C11'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: C11
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                            - object:
                                smart_identification: ''
                                name: C10
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:C10'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: C10
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                            - object:
                                smart_identification: ''
                                name: B9
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:B9'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: B9
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                            - object:
                                smart_identification: ''
                                name: B11
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:B11'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: B11
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                            - object:
                                smart_identification: ''
                                name: B10
                                child_objects: []
                                properties:
                                  - property:
                                      value:
                                        value: Value;GridItem;SelectionItem;TableItem;Text;SpreadsheetItem
                                        regular_expression: false
                                      name: supportedpatterns
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid:B10'
                                        regular_expression: false
                                      name: path
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: nativeclass
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: B10
                                        regular_expression: false
                                      name: name
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: micclass
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                  - property:
                                      value:
                                        value: ''
                                        regular_expression: false
                                      name: frameworkid
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: DataItem
                                        regular_expression: false
                                      name: controltype
                                      hidden: false
                                      read_only: false
                                      type: STRING
                                  - property:
                                      value:
                                        value: UIAObject
                                        regular_expression: false
                                      name: class name
                                      hidden: true
                                      read_only: true
                                      type: STRING
                                comments: ''
                                custom_replay: ''
                                class: UIAObject
                                visual_relations: ''
                                last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                                basic_identification:
                                  property_ref:
                                    - supportedpatterns
                                    - path
                                    - nativeclass
                                    - name
                                    - frameworkid
                                    - controltype
                                  ordinal_identifier: ''
                          properties:
                            - property:
                                value:
                                  value: Selection;Grid;SelectionItem;Spreadsheet
                                  regular_expression: false
                                name: supportedpatterns
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '*:*::SFinvoice.xlsx:Sheet Sheet1:Grid'
                                  regular_expression: false
                                name: path
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: Grid
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: UIATable
                                  regular_expression: false
                                name: micclass
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: DataGrid
                                  regular_expression: false
                                name: controltype
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: UIATable
                                  regular_expression: false
                                name: class name
                                hidden: true
                                read_only: true
                                type: STRING
                          comments: ''
                          custom_replay: ''
                          class: UIATable
                          visual_relations: ''
                          last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                          basic_identification:
                            property_ref:
                              - supportedpatterns
                              - path
                              - name
                              - controltype
                            ordinal_identifier: ''
                    properties:
                      - property:
                          value:
                            value: Selection;Scroll;SelectionItem
                            regular_expression: false
                          name: supportedpatterns
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '*:*::SFinvoice.xlsx:Sheet Sheet1'
                            regular_expression: false
                          name: path
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: nativeclass
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Sheet Sheet1
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAObject
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: frameworkid
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: TabItem
                            regular_expression: false
                          name: controltype
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAObject
                            regular_expression: false
                          name: class name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: UIAObject
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - supportedpatterns
                        - path
                        - nativeclass
                        - name
                        - frameworkid
                        - controltype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: Selection
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*::SFinvoice.xlsx'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: SFinvoice.xlsx
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIATab
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Tab
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIATab
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIATab
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - controltype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: File Tab
              child_objects: []
              properties:
                - property:
                    value:
                      value: Invoke
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*::Ribbon:Ribbon:::Ribbon:FileTabButton'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: File Tab
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAButton
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Button
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAButton
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAButton
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - controltype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Window;Transform;LegacyIAccessible
                regular_expression: false
              name: supportedpatterns
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '*:*'
                regular_expression: false
              name: path
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SFinvoice.xlsx - Excel
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Win32
                regular_expression: false
              name: frameworkid
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Window
                regular_expression: false
              name: controltype
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: class name
              hidden: true
              read_only: true
              type: STRING
        comments: ''
        custom_replay: ''
        class: UIAWindow
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - supportedpatterns
            - path
            - name
            - frameworkid
            - controltype
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Excel_2
        child_objects:
          - object:
              smart_identification: ''
              name: Open
              child_objects:
                - object:
                    smart_identification: ''
                    name: Address
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Value;LegacyIAccessible
                            regular_expression: false
                          name: supportedpatterns
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '*:*:*::40965:41477::41477:41477'
                            regular_expression: false
                          name: path
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Address
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAComboBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ComboBox
                            regular_expression: false
                          name: controltype
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAComboBox
                            regular_expression: false
                          name: class name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: UIAComboBox
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - supportedpatterns
                        - path
                        - name
                        - controltype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: Window;Transform
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*:*'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Open
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Win32
                      regular_expression: false
                    name: frameworkid
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Window
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAWindow
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAWindow
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - frameworkid
                  - controltype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Window;Transform;LegacyIAccessible
                regular_expression: false
              name: supportedpatterns
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '*:*'
                regular_expression: false
              name: path
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: XLMAIN
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Excel
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Win32
                regular_expression: false
              name: frameworkid
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Window
                regular_expression: false
              name: controltype
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: class name
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: automationid
              hidden: false
              read_only: false
              type: STRING
        comments: ''
        custom_replay: ''
        class: UIAWindow
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - supportedpatterns
            - path
            - nativeclass
            - name
            - frameworkid
            - controltype
            - automationid
          ordinal_identifier:
            value: 1
            type: index
    - object:
        smart_identification: ''
        name: Excel
        child_objects:
          - object:
              smart_identification: ''
              name: Open
              child_objects:
                - object:
                    smart_identification: ''
                    name: Open
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Invoke;LegacyIAccessible
                            regular_expression: false
                          name: supportedpatterns
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '*:*:*:1'
                            regular_expression: false
                          name: path
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Open
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIASplitButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: SplitButton
                            regular_expression: false
                          name: controltype
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIASplitButton
                            regular_expression: false
                          name: class name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: UIASplitButton
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - supportedpatterns
                        - path
                        - name
                        - controltype
                      ordinal_identifier: ''
                - object:
                    smart_identification: ''
                    name: 'File name:'
                    child_objects: []
                    properties:
                      - property:
                          value:
                            value: Value;ExpandCollapse;LegacyIAccessible
                            regular_expression: false
                          name: supportedpatterns
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '*:*:*:1148:1148'
                            regular_expression: false
                          name: path
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: 'File name:'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAComboBox
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ComboBox
                            regular_expression: false
                          name: controltype
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: UIAComboBox
                            regular_expression: false
                          name: class name
                          hidden: true
                          read_only: true
                          type: STRING
                    comments: ''
                    custom_replay: ''
                    class: UIAComboBox
                    visual_relations: ''
                    last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
                    basic_identification:
                      property_ref:
                        - supportedpatterns
                        - path
                        - name
                        - controltype
                      ordinal_identifier: ''
              properties:
                - property:
                    value:
                      value: Window;Transform
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*:*'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Open
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAWindow
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Win32
                      regular_expression: false
                    name: frameworkid
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Window
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAWindow
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAWindow
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - frameworkid
                  - controltype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Open
              child_objects: []
              properties:
                - property:
                    value:
                      value: Selection;ScrollItem
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*:::BackstageView:Open:Open::Open'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Open
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAMenu
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Menu
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAMenu
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAMenu
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - controltype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Open Other Workbooks
              child_objects: []
              properties:
                - property:
                    value:
                      value: Invoke;ScrollItem
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*:::BackstageView:New:New:Recent:Open Other Workbooks'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Open Other Workbooks
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAHyperlink
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Hyperlink
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAHyperlink
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAHyperlink
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - controltype
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Browse
              child_objects: []
              properties:
                - property:
                    value:
                      value: Toggle;ScrollItem
                      regular_expression: false
                    name: supportedpatterns
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: '*:*:::BackstageView:Open::Pick a Folder:Browse'
                      regular_expression: false
                    name: path
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Browse
                      regular_expression: false
                    name: name
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAButton
                      regular_expression: false
                    name: micclass
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Button
                      regular_expression: false
                    name: controltype
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: UIAButton
                      regular_expression: false
                    name: class name
                    hidden: true
                    read_only: true
                    type: STRING
              comments: ''
              custom_replay: ''
              class: UIAButton
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - supportedpatterns
                  - path
                  - name
                  - controltype
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Window;Transform;LegacyIAccessible
                regular_expression: false
              name: supportedpatterns
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '*:*'
                regular_expression: false
              name: path
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Excel
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Win32
                regular_expression: false
              name: frameworkid
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Window
                regular_expression: false
              name: controltype
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: UIAWindow
                regular_expression: false
              name: class name
              hidden: true
              read_only: true
              type: STRING
        comments: ''
        custom_replay: ''
        class: UIAWindow
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - supportedpatterns
            - path
            - name
            - frameworkid
            - controltype
          ordinal_identifier: ''
    - object:
        smart_identification: ''
        name: Open_2
        child_objects:
          - object:
              smart_identification: ''
              name: Edit
              child_objects: []
              properties:
                - property:
                    value:
                      value: '41477'
                      regular_expression: false
                    name: window id
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: Edit
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              class: WinEdit
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - window id
                  - nativeclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Open
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: '#32770'
            name: simclass
            type: STRING
        class: Dialog
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
          ordinal_identifier:
            value: 0
            type: location
    - object:
        smart_identification: ''
        name: Open
        child_objects:
          - object:
              smart_identification: ''
              name: Open
              child_objects: []
              properties:
                - property:
                    value:
                      value: '1'
                      regular_expression: false
                    name: window id
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: Button
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - window id
                  - regexpwndclass
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: 'File name:'
              child_objects: []
              properties:
                - property:
                    value:
                      value: Edit
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: 'File &name:'
                      regular_expression: false
                    name: attached text
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              class: WinEdit
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - nativeclass
                  - attached text
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Cancel
              child_objects: []
              properties:
                - property:
                    value:
                      value: Cancel
                      regular_expression: false
                    name: text
                    hidden: false
                    read_only: false
                    type: STRING
                - property:
                    value:
                      value: Button
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              class: WinButton
              visual_relations: ''
              last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
              basic_identification:
                property_ref:
                  - text
                  - nativeclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: Open
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: '#32770'
            name: simclass
            type: STRING
        class: Dialog
        visual_relations: ''
        last_update_time: 'giovedì 8 ottobre 2020 17:09:17'
        basic_identification:
          property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs:
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"descriptionValue"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: descriptionValue
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"description"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: description
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"customerNameValue"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: customerNameValue
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"customerName"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: customerName
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"contractNumberValue"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: contractNumberValue
        type: Output
        class: VerifyObj
    - check_point_and_output:
        standard_properties:
          standard_property:
            - value: ''
              visual_relations: ''
              parameter:
                value: '"contractNumber"'
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
                type: Parameter
              name: text
              flags: '312'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjname
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: testobjgentype
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: Output Value
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: step_type
              flags: '88'
              inner_type: '8'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: parent
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: objectid
              flags: '9'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: micclass
              flags: '3'
              inner_type: '0'
              type: STRING
            - value:
                value: ''
                regular_expression: false
                ignore_space: false
                match_case: false
                not_exact_match: false
                formula: false
              visual_relations: ''
              parameter: ''
              name: class name
              flags: '3'
              inner_type: '0'
              type: STRING
        settings: ''
        name: contractNumber
        type: Output
        class: VerifyObj
  parameters: []
