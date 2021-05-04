namespace: IHQ.RPA.RDPdemo
operation:
  name: act_rdp_actions
  inputs:
    - configLine1
    - configLine2
  sequential_action:
    gav: 'com.microfocus.seq:IHQ.RPA.RDPdemo.act_rdp_actions:1.0.0'
    skills:
      - Web
    settings:
      windows:
        active: false
      web:
        active: false
        address: 'https://login.salesforce.com'
        browser: IE
        close_on_exit: true
    steps:
      - step:
          id: '1'
          object_path: SystemUtil
          action: Run
          args: "\"C:\\Windows\\System32\\mstsc.exe\", \"\"\"F:\\RPA\\Use cases\\SW installation via RDP\\rdp_test.rdp\"\"\""
      - step:
          id: '2'
          action: Script
          object_path: "'comment"
      - step:
          id: '3'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_2")'
          action: Click
          highlight_id: '42'
      - step:
          id: '4'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_3")'
          action: Click
          highlight_id: '48'
      - step:
          id: '5'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_4")'
          action: Click
          highlight_id: '52'
      - step:
          id: '6'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '7'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '8'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '9'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '10'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '11'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '12'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '13'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"notepad"'
          highlight_id: '918830'
      - step:
          id: '14'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_5")'
          action: Click
          highlight_id: '57'
      - step:
          id: '15'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_6")'
          action: Click
          highlight_id: '63'
      - step:
          id: '16'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: 'Parameter("configLine1")'
          highlight_id: '918830'
      - step:
          id: '17'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micReturn
          highlight_id: '918830'
      - step:
          id: '18'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: 'Parameter("configLine2")'
          highlight_id: '918830'
      - step:
          id: '19'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_39")'
          action: Click
          highlight_id: '5'
      - step:
          id: '20'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_40")'
          action: Click
          highlight_id: '19'
      - step:
          id: '21'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_41")'
          action: Click
          highlight_id: '24'
      - step:
          id: '22'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_9")'
          action: Click
      - step:
          id: '23'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '918830'
      - step:
          id: '24'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"file"'
          highlight_id: '918830'
      - step:
          id: '25'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_10")'
          action: Click
          highlight_id: '92'
      - step:
          id: '26'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_11")'
          action: Click
      - step:
          id: '27'
          object_path: 'Window("Remote Desktop Connection")'
          action: Restore
      - step:
          id: '28'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_12")'
          action: Click
          highlight_id: '6'
      - step:
          id: '29'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_13")'
          action: Click
          highlight_id: '19'
      - step:
          id: '30'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micBack
          highlight_id: '722250'
      - step:
          id: '31'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"regedit"'
      - step:
          id: '32'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '33'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_5")'
          action: Click
          highlight_id: '26'
      - step:
          id: '34'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_14")'
          action: Click
          highlight_id: '21'
      - step:
          id: '35'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_15")'
          action: DblClick
          highlight_id: '38'
      - step:
          id: '36'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_16")'
          action: Click
          highlight_id: '43'
      - step:
          id: '37'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_17")'
          action: DblClick
          highlight_id: '49'
      - step:
          id: '38'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_18")'
          action: Click
          args: '52,32,micRightBtn'
          highlight_id: '4'
      - step:
          id: '39'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_29")'
          action: Click
          highlight_id: '13'
      - step:
          id: '40'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_30")'
          action: Click
          highlight_id: '17'
      - step:
          id: '41'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"vieri"'
          highlight_id: '984394'
      - step:
          id: '42'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micReturn
          highlight_id: '984394'
      - step:
          id: '43'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_20")'
          action: Click
          args: '18,7,micRightBtn'
          highlight_id: '21'
      - step:
          id: '44'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_31")'
          action: Click
          highlight_id: '28'
      - step:
          id: '45'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_32")'
          action: Click
          highlight_id: '35'
      - step:
          id: '46'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"vieri1"'
          highlight_id: '984394'
      - step:
          id: '47'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micReturn
          highlight_id: '984394'
      - step:
          id: '48'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_33")'
          action: Click
          args: '22,5,micRightBtn'
          highlight_id: '41'
      - step:
          id: '49'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_34")'
          action: Click
          highlight_id: '51'
      - step:
          id: '50'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_27")'
          action: Click
          highlight_id: '54'
      - step:
          id: '51'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"abc"'
          highlight_id: '984394'
      - step:
          id: '52'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_26")'
          action: Click
          highlight_id: '58'
      - step:
          id: '53'
          object_path: 'Window("Remote Desktop Connection")'
          action: Restore
      - step:
          id: '54'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_35")'
          action: Click
          highlight_id: '5'
      - step:
          id: '55'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_36")'
          action: Click
          highlight_id: '16'
      - step:
          id: '56'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_43")'
          action: Click
          highlight_id: '1'
      - step:
          id: '57'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_44")'
          action: Click
          highlight_id: '17'
      - step:
          id: '58'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: '"ping localhost -n 10 -4"'
      - step:
          id: '59'
          object_path: 'Window("Remote Desktop Connection").WinObject("Text")'
          action: Type
          args: micReturn
      - step:
          id: '60'
          action: Script
          object_path: check=0
      - step:
          id: '61'
          action: Script
          object_path: counter=1
      - step:
          id: '62'
          action: Script
          object_path: While check <= 0
      - step:
          id: '63'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '64'
          action: Script
          object_path: 'output = Window("Remote Desktop Connection").WinObject("Text").GetVisibleText()'
      - step:
          id: '65'
          action: Script
          object_path: 'substring = "Ping statistics"'
      - step:
          id: '66'
          action: Script
          object_path: 'check = InStr(1,output,substring,1)'
      - step:
          id: '67'
          action: Script
          object_path: counter=counter+1
      - step:
          id: '68'
          action: Script
          object_path: If counter=10 then
      - step:
          id: '69'
          action: Script
          object_path: 'print "Error"'
      - step:
          id: '70'
          action: Script
          object_path: check=1
      - step:
          id: '71'
          action: Script
          object_path: End if
      - step:
          id: '72'
          action: Script
          object_path: Wend
      - step:
          id: '73'
          object_path: 'Window("Remote Desktop Connection").InsightObject("InsightObject_11")'
          action: Click
      - step:
          id: '74'
          object_path: 'Window("Remote Desktop Connection")'
          action: close
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
