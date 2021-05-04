namespace: Tests.pylightxl
operation:
  name: read_row
  inputs:
    - file_path
    - ws
    - row
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(file_path,ws,row):\n    # code goes here\n    import importlib\n    xl = importlib.import_module('pylightxl')\n    db = xl.readxl(fn=file_path, ws=ws)\n    row_content = db.ws(ws=ws).row(row=int(row))\n    \n    return {\n        \"row_content\": row_content\n    }\n# you can add additional helper methods below."
  outputs:
    - row_content
  results:
    - SUCCESS
