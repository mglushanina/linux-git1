#!/bin/bash

# Указываем путь к исходному CSV-файлу и создаем выходной CSV-файл
input_file="/home/users/datasets/hotels.csv"
output_file="/tmp/hotels_filtered.csv"

# Используем awk для фильтрации строк и выбора только нужных колонок
awk -F',' 'BEGIN {OFS=","} NR==1 {print $13, $17} NR>1 && $13 != -1 && $17 != -1 {print $13, $17}' $input_file > $output_file

echo "Файл успешно создан: $output_file"

