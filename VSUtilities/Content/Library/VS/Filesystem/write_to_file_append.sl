namespace: VS.Filesystem
operation:
  name: write_to_file_append
  inputs:
    - file_path
    - text
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(file_path,text):\n    # code goes here\n    try:\n     f = open(file_path, 'a+')\n     f.seek(0)\n     data =f.read(100)\n     if len(data) > 0 :\n        f.write(\"\\n\")\n    # Append text at the end of file\n     f.write(text)\n     f.close()\n     message = 'writing done successfully'\n     res = True\n     return { \"message\": message,\n         \"res\": res\n     }\n    except IOError as e:\n       message =  \"ERROR: no such folder or permission denied: \" + str(e)\n       res = False\n       return { \"message\": message}\n    except Exception as e:\n       message =  e\n       res = False\n       return { \"message\": message}\n# you can add additional helper methods below."
  outputs:
    - message
    - res
  results:
    - SUCCESS
