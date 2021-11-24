# maintbase
リモートメンテナンス用の端末を作成するためのAnsibleスクリプトです。
このスクリプトでは、以下の監視及びメンテナンスツールがセットアップされます。

* 監視
  * Zabbix 5.4
  * PostgreSQL 13
  * TimescaleDB 2.4.2(予定)
* パケットキャプチャ
  * tcpdump 4.99
* syslogサーバー
  * syslog-ng 3.28
* ファイルサーバー
  * samba 4.13

# 環境
* Debian 11
* CPU AMD64
* memory >2GB
* HDD >16GB

# 利用方法

初期セットアップ
```
# ansible-playbook setup.yml
```
