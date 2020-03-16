# selkov_infra
selkov Infra repository

-------------------------
Данные для подключения
-------------------------
bastion_IP = 35.233.3.203
someinternalhost_IP = 10.132.0.4

-------------------------
Конфигурация
-------------------------
Два экземпляра VM:
- bastion
- someinternalhost (без внешней сети)

Bastion host используется для сквозного подключения. На нем установлен VPN Pritunl, использующий порт udp 13982.

Панель управления Pritunl:
https://35.233.3.203
Login: pritunl
Password: slack - #alexei.selkov

Подключение к VPN-серверу:
Установить VPN-клиент: https://client.pritunl.com/
Username: test
PIN: slack - #alexei.selkov
Подключение к VPN-серверу bastion осуществляется с использованием конфигурационного файла cloud-bastion.ovpn

-------------------------
Дополнительные задания
-------------------------
1.1 ssh -A -tt appuser@35.233.3.203 ssh -tt 10.132.0.4

1.2 ssh someinternalhost
~/.ssh/config
Host someinternalhost
    HostName 10.132.0.4
    ProxyJump appuser@35.233.3.203
    User appuser

2. https://35.233.3.203.sslip.io
