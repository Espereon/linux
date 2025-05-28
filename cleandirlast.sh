#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Ошибка, укажите путь к директории" >&2
    exit 1
fi

DIR_PATH="$1"


if [ ! -d "$DIR_PATH" ]; then
    echo "Ошибка, директория \"$DIR_PATH\" не существует" >&2
    exit 1
fi


read -p "Вы уверены, что хотите удалить директорию \"$DIR_PATH\" и всё её содержимое? (y/n)" choice
case "$choice" in
    y|Y ) 
        rm -rf "$DIR_PATH"
        if [ $? -eq 0 ]; then
            echo "Директория \"$DIR_PATH\" была успешно удалена."
        else
            echo "Возникла ошибка при удалении директории \"$DIR_PATH\"." >&2
        fi
        ;;
    * )
        echo "Отмена операции удаления."
        exit 0
        ;;
esac
