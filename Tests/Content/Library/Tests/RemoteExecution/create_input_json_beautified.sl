namespace: Tests.RemoteExecution
operation:
  name: create_input_json_beautified
  inputs:
    - inputs
    - values
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(inputs,values):\n    # code goes here\n    input = inputs.split(\",\")\n    value = values.split(\",\")\n\n    inputSize = len(input)\n    valueSize = len(value)\n    if inputSize == valueSize:\n      index = 0\n      output = \"\\\"inputs\\\": { \\\\\\n\"\n      while index < inputSize:\n        output = output +'\"' + input[index] + '\"' + ': ' + '\"' + value[index] + '\"' + ', \\\\\\n'\n        index += 1\n\n      output = output[:-4]\n      output = output + ' \\\\\\n  }  \\\\'\n# you can add additional helper methods below.\n      return {\n          \"inputs_json\": output\n      }"
  outputs:
    - inputs_json
  results:
    - SUCCESS
