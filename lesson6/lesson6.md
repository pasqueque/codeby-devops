# Домашнее задание по уроку 6

## 1. LXD контейнеры

### Запустить LXD контейнер в Linux на основе любой ОС

1. Установка lxd

![snap lxc](./install_lxd.png)

2. Инициализация lxd

![lxd init](./lxd_init.png)

3. Удаленные репозитории

![remote list](./remote_list.png)

4. Просмотр образов в репозитории:

![image_list](./lxc_image_list.png)

5. Информация об образе:

![image_info](./image_info.png)

6. Создание контейнера:

![launch_image](./launch.png)

7. Создание контейнера:

![container_info](./info_container.png)

8. Выполнение команд в контейнере:

![container_exec](./exec_apache.png)

### Установить в контейнере веб-сервер Apache

В контейнере установлен apache2 и проверено подключение из хостовой машины:

![apache](./apache_in_lxc.png)

## 2. Vagrant

### Создать multi-machine Vagrantfile для запуска двух ВМ client и server на основе любых Vagrant Box.

- Установка vagrant из deb-пакета

![vagrant_install](./install_vagrant.png)

- Инициализация vagrant, выбраны настройки по умолчанию и проинициализирован VagrantFile.

![vagrant_init](./vagrant_init.png)

- Vagrantfile изменен для создания multi-machine client и server: [Vagrantfile](./Vagrantfile)

### Написать такой shell-скрипт для провижининга ВМ, который позволит после старта машин войти на ВМ client через команду vagrant ssh client , а уже из консоли client подключиться к ВМ server c помощью ssh-key по команде ssh -i <path_private_key_file> server

Написать полностью последовательное подключение именно с помощью provision не получается, можно последовательно подключаться через ssh -J или c вложенной командой `vagrant ssh -c "ssh -o \"StrictHostKeyChecking no\" -i /vagrant/.vagrant/machines/server/virtualbox/private_key -l vagrant 192.168.56.101" client`, которая сначала подключается к клиенту через vagrant ssh, а затем оттуда выполняется команда подключения к server по кзакрытому ключу.

В рамках provision просто реализовано подключение к server от client по ssh:

![provision](./provision.png)
