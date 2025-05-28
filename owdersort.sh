#!/bin/bash


if [ "$#" -lt 1 ]; then
    echo "Использовать: $0 <путь_к_директории>" >&2
    exit 1
fi

SOURCE_DIR="$1"


if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: Директория '$SOURCE_DIR' не существует." >&2
    exit 1
fi


cd "$SOURCE_DIR" || { echo "Ошибка смены рабочей директории"; exit 1; }


for file in *; do
    if [ -f "$file" ]; then
        owner=$(stat -c '%U' "$file")


        mkdir -p "$owner"


        cp "$file" "./$owner/"
    fi
done

echo "Копирование завершилось успешно."
