namespace: Tests.pylightxl
operation:
  name: read_excel_cell
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute():\n    # code goes here\n    import importlib\n    xl = importlib.import_module('pylightxl')\n    db = xl.readxl(fn='C:/Use cases/order_data.xlsx', ws='orders')\n\n    cell_value = db.ws(ws='orders').index(row=4, col=3)\n    \n# you can add additional helper methods below.\n    return { \"cell_value\": str(cell_value)\n    }"
  outputs:
    - cell_value
  results:
    - SUCCESS
