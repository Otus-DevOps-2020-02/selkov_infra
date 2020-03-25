# selkov_infra
selkov Infra repository

# Домашняя работа 4
## Данные для подключения
testapp_IP = 35.246.164.237
testapp_port = 9292

## Проверка работы
http://35.246.164.237:9292

## Дополнительное задание 1
- Скрипт создания VM и Firewall rules
[create_gcloud.sh](/Otus-DevOps-2020-02/selkov_infra/blob/cloud-testapp/create_gcloud.sh)
- Скрипт установки Ruby, MongoDB и деплоя приложения Reddit
[startup_script.sh](/Otus-DevOps-2020-02/selkov_infra/blob/cloud-testapp/startup_script.sh)

## Дополнительное задание 2
Команда gcloud для создания правила firewall:<br>
<code>gcloud compute firewall-rules create default-puma-server --allow=tcp:9292 --source-ranges=0.0.0.0/0 --target-tags=puma-server</code>


# Домашняя работа 3

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
