include:
  - postgres

/etc/postgresql/9.1/main/pg_hba.conf:
  file:
    -managed
    - source: salt://readthedocs/files/pg_hba.conf
    - mode: 0755
    - user: root
    - group: root
    - watch_in:
      - service: postgresql

postgresql-docs:
  postgres_user:
    - present
    - name: docs
    - password: docs
    - login: True
    - require:
      - service: postgresql

  postgres_database:
    - present
    - name: docs
    - owner: docs
    - require:
      - postgres_user: postgresql-docs

