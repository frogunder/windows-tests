# Various Windows Tests

---------------

# Testing salt-call

{% set salt_call = 'c:\\salt\\salt-call.bat'  %}
{% set replace_file_name = 'c:\\windows\\temp\\salt-call-replace-file.txt'  %}

create_file:
  file.managed:
    - name: {{ replace_file_name }}
    - contents: |
        this is a free-
        form text file.

replace_file:
  cmd.run:
    - name: '{{ salt_call }} --local file.replace {{ replace_file_name }} pattern="form" repl="for-all"'

---------------

# Testing cmd.run

cmd_run:
  module.run:
    - name: cmd.run
    - cmd: type c:\salt\conf\minion > nul
    - python_shell: True

---------------






   
