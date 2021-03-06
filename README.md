# selkov_infra
selkov Infra repository

# Домашняя работа 6
## Данные для подключения
testapp_IP = 34.96.87.83
testapp_port = 80

## Проверка работы
http://34.96.87.83

- Запуск VM при помощи terraform
[main.tf](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/main.tf)
- Выходные переменные
[outputs.tf](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/outputs.tf)
- Добавление провижинеров
[puma.service](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/files/puma.service)
[deploy.sh](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/files/deploy.sh)
- Параметризирование конфигурационных файлов
[variables.tf](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/variables.tf)
- Определение переменных
[terraform.tfvars](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/terraform.tfvars.example)

## Задание со*
- Добавлены SSH-ключи для пользователей appuser1 и appuser2
- При terraform apply, ключи, созданные через панель удаляются

## Задание с **
- HTTP Load Balancer
[lb.tf](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/terraform-1/terraform/lb.tf)
- Проблема в том, что созданная конфигурация - два разных приложения с двумя отдельными БД


# Домашняя работа 5
## Данные для подключения
testapp_IP = 35.242.237.27
testapp_port = 9292

## Проверка работы
http://35.242.237.27:9292

- Создан Packer template и параметризирован
[ubuntu16.json](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/packer/ubuntu16.json)
-  Определены пользовательские переменные в отдельный файл
[variables.json.example](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/packer/variables.json.example)

## Дополнительное задание 1
“Запечены” (bake) в image VM все зависимости приложения и сам код приложения
- Шаблон, в котором два скрипта: [immutable.json](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/packer/immutable.json)
- Скрипт установки и запуска, с использованием systemd для управление юнитом, для запуска кода приложения: [startup_script.sh](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/packer/files/startup_script.sh)
- Сервис юнит-файл: [reddit.service](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/packer/files/reddit.service)

## Дополнительное задание 2
Создан shell-скрипт для создания VM из собранного образа:
[create-redditvm.sh](https://github.com/Otus-DevOps-2020-02/selkov_infra/blob/packer-base/config-scripts/create-redditvm.sh)


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
