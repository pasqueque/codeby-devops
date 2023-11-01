# Домашние задание по уроку 4 - РАБОТА С ОПЕРАЦИОННОЙ СИСТЕМОЙ LINUX

## Изменить конфигурацию ОС

- изменить hostname

![hostname](./hostname.png)

> При изменении hostname также необходимо менять /etc/hosts

![hosts](./etc_hosts_modify.png)

- изменить timezone

![timezone](./timezone.png)

- установить любой баннер при логине пользователя (MOTD)

![notd](./motd_change.png)

## Подключение к ВМ через SSH с напечатанным выводом MOTD

![hostname](./ssh_login_with_motd.png)

## Вывод системной информации о

- версии ядра

![uname](./kernel_version.png)

- модулях ядра (loaded and active)

![module_info](./module_info_lsmod.png)

- информации о ресурсах (CPU and Memory)

![top](./top.png)

![resources](./resources.png)

- информации о пользователях и группах

![passwd](./passwd.png)

![groups](./groups.png)

## Залогировать с помощью утилиты script

- вывод всех процессов в системе

![ps](./ps-efh.png)

- вывод всех процессов для своего пользователя
- запуск процесса top в background
- остановку процесса top, работающего в background

Лог файл утилиты script: [ps-log](./ps-log.txt)

## Установить две различные версии java jdk

- из пакетного репозитория

![java_apt](./java_apt_install.png)

![java_version](./java_version.png)

- из архива, скаченного из Интернет

![unpack_jdk](./unpack_jdk.png)

![java_web](./install_version_java_from_web.png)

Записан с помощью утилиты script лог-файл выполнения команды java -version и переключения
между версиями: [java-log](./java-log.txt)

## Установить nginx

- выключить и убрать из автозапуска имеющийся Nginx-сервис (если есть)

> После установки через apt он выключен и в статусе disabled

- добавить свой unit-файл для запуска Nginx в качестве сервиса

> Unit - файл создан при установке, поэтому свой не добавлялся

- добавить Nginx-сервис в автозапуск

> Сервис добавлен через systemctl enable

Лог Nginx: [nginx_log](./nginx-log.txt)
