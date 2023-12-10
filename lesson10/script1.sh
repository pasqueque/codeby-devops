#!/bin/bash
#whoami
current_user=$(whoami)

# Создаем папку myfolder в домашней папке текущего пользователя, если ее не существует
if [ ! -d /home/$current_user/myfolder ]; then
        mkdir /home/$current_user/myfolder 
else
        echo "Папка уже существует, остальные действия будут выполнены"
fi

# Создаем файл с двумя строками: приветствие и текущее время и дата
echo "Привет, мир!" > /home/$current_user/myfolder/file1.txt
echo $(date) >> /home/$current_user/myfolder/file1.txt

# Создаем пустой файл с правами 777, если его не существует
if [ ! -f  /home/$current_user/myfolder/file2.txt ]; then
        touch /home/$current_user/myfolder/file2.txt
fi
chmod 777 /home/$current_user/myfolder/file2.txt


# Создаем файл с одной строкой длиной в 20 случайных символов
tr -dc A-Za-z </dev/urandom | head -c 20 > /home/$current_user/myfolder/file3.txt

# Создаем пустые файлы 4 и 5
if [ ! -f  /home/$current_user/myfolder/file4.txt ] || [ ! -s /home/$current_user/myfolder/fi>
        touch /home/$current_user/myfolder/file4.txt
fi
if [ ! -f  /home/$current_user/myfolder/file5.txt ] || [ ! -s /home/$current_user/myfolder/fi>
        touch /home/$current_user/myfolder/file5.txt
fi

