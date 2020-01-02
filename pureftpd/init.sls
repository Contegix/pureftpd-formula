{% from "pureftpd/map.jinja" import pureftpd with context %}

pureftpd_install:
  pkg.installed:
    - name: {{ pureftpd.pkg }}
  service.running:
    - name: {{ pureftpd.service }}
    - enable: True
    - reload: False

pureftpd_config:
  file.managed:
  - name: /etc/pure-ftpd/pure-ftpd.conf
  - source: salt://pureftpd/templates/tmp.tmpl
  - template: jinja
  - listen_in:
    - service: {{ pureftpd.service }}
