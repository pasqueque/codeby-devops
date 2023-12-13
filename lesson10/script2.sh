#!/bin/bash
#whoami
current_user=$(whoami)

if [ -d /home/$current_user/myfolder ]; then

        # Определяем количество файлов в папке myfolder и выводим на экран
        file_count=$(ls -l /home/$current_user/myfolder | grep ^- | wc -l)
        echo "Количество файлов в папке myfolder: $file_count"

        # Исправляем права второго файла с 777 на 664
        if [ -f /home/$current_user/myfolder/file2.txt ]; then  
                chmod 664 /home/$current_user/myfolder/file2.txt
        else
                echo "script2.sh уже был запущен и file2 уже удален, чтобы его создать запустите script1.sh"
        fi
        # Определяем пустые файлы и удаляем их
        find /home/$current_user/myfolder -type f -empty -delete

        # Удаляем все строки кроме первой в остальных файлах
        for file in /home/$current_user/myfolder/*; do
                sed -i '2,$d' $file
                echo "все строки кроме первой удалены в файле $file"
        done    
else
        echo "Не существует папка ~/myfolder. Запустите сначала скрипт script1.sh"
fi

