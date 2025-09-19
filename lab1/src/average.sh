#!/bin/bash

# Проверяем, что аргументы переданы
if [ $# -eq 0 ]; then
    echo "Ошибка: Не переданы аргументы"
    exit 1
fi

# Инициализируем переменные
count=$#
sum=0

# Суммируем все аргументы
for num in "$@"; do
    # Проверяем, что аргумент - число
    if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
        echo "Ошибка: '$num' не является числом"
        exit 1
    fi
    sum=$((sum + num))
done

# Вычисляем среднее арифметическое (целая часть)
integer_part=$((sum / count))

# Вычисляем дробную часть (до двух знаков)
remainder=$((sum % count))
fractional_part=$((remainder * 100 / count))

# Форматируем вывод
if [ $fractional_part -eq 0 ]; then
    average=$integer_part
else
    average="${integer_part}.${fractional_part}"
fi

# Выводим результат
echo "Количество аргументов: $count"
echo "Среднее арифметическое: $average"