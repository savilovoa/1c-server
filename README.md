# docker-1c-server

## Что это?

1c-server -- это сервер 1С:Предприятия в контейнере Docker.
MAIN Ubunta:xenial

Сделан на основе a4neg/1c-server 
Убраны шрифты, добавлена инсталляция вес-сервиса и права на папку

## Как это установить?

Для установки и начального запуска получите дистрибутив сервера 1С:Предприятия: https://users.v8.1c.ru/ -> Скачать обновления -> Технологическая платформа 8.3 -> ВЕРСИЯ -> Cервер 1С:Предприятия (64-bit) для DEB-based Linux-систем -> Скачать дистрибутив

Клонируйте репозиторий:

    git clone https://github.com/savilovoa/1c-server.git

Скопируйте deb-файлы дистрибутива сервера 1С:Предприятия в каталог `/deb`, в файлу Dockerfile отредактируйте номер версии  и затем выполните команды:

    cd 1c-server
    ./build.sh
    ./run.sh

## Использование
Предпологается использование совместно в Prostgresql в Docker-контейнере. К примеру https://github.com/rsyuzyov/docker-postgresql-pro-1c
У меня не подключалось Администрирование серверов без указания --link=postgresql:db. Сервер базы данных в таком случае указывать db


## Где мои данные?

Данные сервера 1С:Предприятия вы можете найти в каталогах `/var/lib/docker/volumes/1c-server-home/_data` (домашний каталог пользователя `usr1cv8`) и `/var/lib/docker/volumes/1c-server-logs/_data` (технологические журналы).
По умлочанию монтируется в /mnt/1c_data

## Как это удалить?

Удалите контейнер:

    docker rm -f 1c-srv

Удалите образ:

    docker rm savilovoa/1c-server

:fire: Удалите данные:

    docker volume rm 1c-server-home
    docker volume rm 1c-server-logs
