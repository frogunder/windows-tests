# Various Windows Tests

#---------------

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

#---------------

# Testing cmd.run

cmd_run:
  module.run:
    - name: cmd.run
    - cmd: type c:\salt\conf\minion > nul
    - python_shell: True

#---------------

# Testing cp

cp_get_url:
  module.run:
    - name: cp.get_url
    - path: https://kernel.org/pub/linux/kernel/v4.x/linux-4.1.tar.xz
    - dest: 'c:\\windows\\temp\\linux-4.1.tar.xz'

#---------------

# Testing firewall

firewall_get_config:
  module.run:
    - name: firewall.get_config

firewall_disable:
  module.run:
    - name: firewall.disable

firewall_enable:
  module.run:
    - name: firewall.enable

firewall_get_rule:
  module.run:
    - name: firewall.get_rule
    - m_name: 'Remote Event Log Management (NP-In)'

firewall_add_rule:
  module.run:
    - name: firewall.add_rule
    - m_name: test_rule
    - localport: 8080

firewall_delete_rule:
  module.run:
    - name: firewall.delete_rule
    - m_name: test_rule
    - localport: 8080
    - protocol: tcp
    - dir: in

#--------------




   
