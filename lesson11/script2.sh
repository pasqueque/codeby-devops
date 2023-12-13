#!/bin/bash

FOLDER=myfolder

if [ -d /home/"$USER"/"$FOLDER" ]; then

        # Определяем количество файлов в папке "$FOLDER" и выводим на экран
        file_count=$(ls -l /home/"$USER"/"$FOLDER" | grep ^- | wc -l)
        echo "Количество файлов в папке $FOLDER: $file_count"

        # Исправляем права второго файла с 777 на 664
        if [ -f /home/"$USER"/"$FOLDER"/file2.txt ]; then  
                chmod 664 /home/"$USER"/"$FOLDER"/file2.txt
        else
                echo "script2.sh уже был запущен и file2 уже удален, чтобы его создать запустите script1.sh"
        fi
        # Определяем пустые файлы и удаляем их
        find /home/"$USER"/"$FOLDER" -type f -empty -delete

        # Удаляем все строки кроме первой в остальных файлах
        for file in /home/"$USER"/"$FOLDER"/*; do
                sed -i '2,$d' "$file"
                echo "все строки кроме первой удалены в файле $file"
        done    
else
        echo "Не существует папка ~/$FOLDER. Запустите сначала скрипт script1.sh"
fi

