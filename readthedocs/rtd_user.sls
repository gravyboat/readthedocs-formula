# User setup

docs:
  user:
    - present
    - fullname: Docs User
    - uid: 1005
    - gid: 205
    - home: /home/docs
    - shell: /bin/bash
    - createhome: True
    - require:
      - group: docs
  group.present:
    - gid: 205

bash_profile
  file:
    - managed
    - name: /home/docs/.bash_profile:
    - source: salt://readthedocs/files/bash_profile
    - user: docs
    - group: docs
    - require:
      - user: docs

ssh_dir:
  file:
    - directory
    - name: /home/docs/.ssh
    - user: docs
    - group: docs
    - mode: 0700
    - require:
      - user: docs

# TODO configure key based on host name

id_rsa:
  file:
    - managed
    - name: /home/docs/.ssh/id_rsa:
    - source: salt://readthedocs/files/private_key
    - user: docs
    - group: docs
    - mode: 0400
    - require:
      - user: docs
