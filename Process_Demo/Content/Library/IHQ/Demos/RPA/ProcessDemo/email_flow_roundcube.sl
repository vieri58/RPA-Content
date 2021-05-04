namespace: IHQ.Demos.RPA.ProcessDemo
flow:
  name: email_flow_roundcube
  workflow:
    - get_mail_message_count:
        do:
          io.cloudslang.base.mail.get_mail_message_count:
            - host: 16.57.146.170
            - port: '143'
            - protocol: imap
            - username: operator
            - password:
                value: opsware
                sensitive: true
            - folder: INBOX
            - enable_TLS: 'true'
            - trust_all_roots: 'true'
        publish:
          - email_count: '${return_result}'
          - mailServer: '${host}'
          - imapPort: '${port}'
          - mailUsername: '${username}'
          - mailPassword: '${password}'
        navigate:
          - SUCCESS: get_mail_attachment
          - FAILURE: on_failure
    - get_mail_attachment:
        do:
          io.cloudslang.base.mail.get_mail_attachment:
            - host: '${mailServer}'
            - port: '${imapPort}'
            - protocol: imap
            - username: '${mailUsername}'
            - password:
                value: '${mailPassword}'
                sensitive: true
            - message_number: '${email_count}'
            - destination: "C:\\rpatemp"
            - attachment_name: invoice.pdf
            - overwrite: 'true'
            - trust_all_roots: 'true'
            - enable_TLS: 'true'
        navigate:
          - SUCCESS: ocr_pdf_1
          - FAILURE: on_failure
    - insert_order_details:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: localhost
            - db_type: PostgreSQL
            - username: postgres
            - password:
                value: admin@123
                sensitive: true
            - db_port: '5432'
            - database_name: order_system
            - command: "${\"INSERT INTO orders Values (\"+order_number+\",'\"+last_name+\"','\"+first_name+\"',\"+ammount+\")\"}"
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: get_total_order_number
          - FAILURE: on_failure
    - get_total_order_number:
        do:
          io.cloudslang.base.database.sql_command:
            - db_server_name: localhost
            - db_type: PostgreSQL
            - username: postgres
            - password:
                value: admin@123
                sensitive: true
            - db_port: '5432'
            - database_name: order_system
            - command: 'SELECT COUNT(*) FROM orders'
            - trust_all_roots: 'true'
        publish:
          - total_orders: '${output_text}'
        navigate:
          - SUCCESS: send_email_notification
          - FAILURE: on_failure
    - send_email_notification:
        do:
          io.cloudslang.base.mail.send_mail:
            - hostname: '${mailServer}'
            - port: '25'
            - from: RPAdemo@hpeswlab.net
            - to: RPAUser1@hpeswlab.net
            - cc: null
            - subject: "${'Order Creation Report - '+order_number}"
            - body: "${'<p>Order was created with the below details:</p><p>&nbsp;</p><ul><li>Order Number: '+order_number+'</li><li>First Name: '+first_name+'</li><li>Last Name: '+last_name+'</li><li>Order Ammount: '+ammount+'</li></ul><p>&nbsp;</p><p>the total number of orders in the CRM is '+total_orders+'</p>'}"
            - username: null
            - password:
                sensitive: true
            - enable_TLS: 'true'
        publish:
          - exception
          - return_code
          - return_result
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
    - ocr_pdf_1:
        do:
          IHQ.Demos.RPA.ProcessDemo.ocr_pdf: []
        publish:
          - order_number: "${cs_regex(order_number,\"([^ ]+\\w$)\")}"
          - first_name: "${cs_regex(first_name,\"([^ ]+\\w$)\")}"
          - last_name: "${cs_regex(last_name,\"([^ ]+\\w$)\")}"
          - ammount: "${cs_regex(ammount,\"([^ ]+\\w$)\")}"
        navigate:
          - SUCCESS: insert_order_details
          - WARNING: insert_order_details
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      get_mail_message_count:
        x: 100
        'y': 150
      get_mail_attachment:
        x: 101
        'y': 320
      ocr_pdf_1:
        x: 222
        'y': 152
      insert_order_details:
        x: 215
        'y': 319
      get_total_order_number:
        x: 365
        'y': 155
      send_email_notification:
        x: 370
        'y': 324
        navigate:
          95aae46d-2b5d-893e-1dff-0b9f3f86927a:
            targetId: a8f5c1f1-c32c-e82f-3c01-f6a5467da35e
            port: SUCCESS
    results:
      SUCCESS:
        a8f5c1f1-c32c-e82f-3c01-f6a5467da35e:
          x: 524
          'y': 158
