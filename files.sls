file_managed:
  file.managed:
    - name: c:/test/test
    - makedirs: True
    - contents: |
        Only a test

file_copy:
  file.copy:
    - name: c:/test/test1
    - source: c:/test/test
    - makedirs: True
    - preserve: True

file_comment:
  file.comment:
    - name: c:/test/test1
    - regex: '^Only'

file_replace:
  file.replace:
    - name: c:/test/test1
    - pattern: 'test'
    - repl: 'testing'

add_file:
  file.managed:
    - name: c:/test/test2
    - makedirs: True
    - contents: |
        Only a test

file_absent:
  file.absent:
    - name: c:/test/test2

recursive_configs:
  file.recurse:
    - name: c:/test/test2
    - source: salt://test
    - include_empty: True

remove_dir: 
  file.absent:
    - name: c:/test/

