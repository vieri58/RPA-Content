namespace: VS.Strings.Actions
operation:
  name: get_char_position
  inputs:
    - input_string
    - char_to_find
  python_action:
    use_jython: false
    script: "# do not remove the execute function\ndef execute(input_string,char_to_find):\n  \n    error_message = \"\"\n    if char_to_find in input_string:\n        char_index = input_string.index(char_to_find)\n        return {\"char_index\": char_index}\n    else:\n        error_message = \"Char not found\"\n        return {\"error_message\": error_message}\n# you can add additional helper methods below."
  outputs:
    - error_message
    - char_index
  results:
    - SUCCESS
