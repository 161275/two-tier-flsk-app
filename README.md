kubectl create configmap init-sql --from-file=message.sql

volumeMounts:
- name: init-sql-volume
  mountPath: /docker-entrypoint-initdb.d/message.sql
  subPath: message.sql
volumes:
- name: init-sql-volume
  configMap:
    name: init-sql