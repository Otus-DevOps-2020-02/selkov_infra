# selkov_infra
selkov Infra repository

## Данные для подключения
- testapp_IP = 35.246.164.237
- testapp_port = 9292

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
