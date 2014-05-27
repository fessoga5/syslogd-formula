# vim: sts=2 ts=2 sw=2 ai et
#Speedtest.net test
{% if grains['os'] == 'FreeBSD' %}
syslogd:
  service:
      - running
      - enable: True
      - watch:
        - file: /etc/syslog.conf

/etc/syslog.conf:
  file.managed:
    - mode: 640
    - source: salt://syslogd/syslog.conf
    - template: jinja

newsyslog:
  service:
      - running
      - enable: True
      - watch:
        - file: /etc/newsyslog.conf

/etc/newsyslog.conf:
  file.managed:
    - mode: 640
    - source: salt://syslogd/newsyslog.conf
    - template: jinja

{% endif %}
