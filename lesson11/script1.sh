#!/bin/bash

FOLDER=myfolder

# Создаем папку myfolder в домашней папке текущего пользователя, если ее не существует
if [ ! -d /home/"$USER"/"$FOLDER" ]; then
        mkdir /home/"$USER"/"$FOLDER" 
else
        echo "Папка уже существует, остальные действия будут выполнены"
fi

# Создаем файл с двумя строками: приветствие и текущее время и дата
echo "Привет, мир!" > /home/"$USER"/"$FOLDER"/file1.txt
date >> /home/"$USER"/"$FOLDER"/file1.txt

# Создаем пустой файл с правами 777, если его не существует
if [ ! -f /home/"$USER"/"$FOLDER"/file2.txt ]; then
        touch /home/"$USER"/"$FOLDER"/file2.txt
fi
chmod 777 /home/"$USER"/"$FOLDER"/file2.txt


# Создаем файл с одной строкой длиной в 20 случайных символов
tr -dc A-Za-z </dev/urandom | head -c 20 > /home/"$USER"/"$FOLDER"/file3.txt

# Создаем пустые файлы 4 и 5 если файла не существует или он не пустой
if [ ! -f /home/"$USER"/"$FOLDER"/file4.txt ] || [ ! -s /home/"$USER"/"$FOLDER"/file4.txt ]; then
        touch /home/"$USER"/"$FOLDER"/file4.txt
fi
if [ ! -f /home/"$USER"/"$FOLDER"/file5.txt ] || [ ! -s /home/"$USER"/"$FOLDER"/file5.txt ]; then
        touch /home/"$USER"/"$FOLDER"/file5.txt
fi