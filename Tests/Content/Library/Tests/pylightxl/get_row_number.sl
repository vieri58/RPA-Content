namespace: Tests.pylightxl
operation:
  name: get_row_number
  inputs:
    - file_path
    - ws
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(file_path,ws):\n    # code goes here\n    import importlib\n    xl = importlib.import_module('pylightxl')\n    db = xl.readxl(fn=file_path, ws=ws)\n    \n    num_rows = db.ws(ws=ws).size[0]\n    \n    return {\n        \"num_rows\": num_rows\n    }\n    \n    \n# you can add additional helper methods below."
  outputs:
    - num_rows
  results:
    - SUCCESS
