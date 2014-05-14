include:
  - memcached

memcached_conf:  
  file:
    - managed
    - name: /etc/memcached.conf
    - source: salt://readthedocs/files/memcached.conf
    - user: root
    - group: root
    - mode: 0640
    - watch_in:
      - service: memcached
