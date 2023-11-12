#!/bin/bash

input_file="/home/users/datasets/hotels.csv"
output_file="/home/mglushanina/linux-git1/tmp/hotels_filtered.csv"

# Подсчет строк в исходном файле
total_lines_before=$(wc -l < "$input_file")

# Удаление строк с -1 в cleanliness или overall_ratingsource и сохранение только колонок 12 и 18
awk -F',' 'BEGIN {OFS=","} $12 != -1 && $18 != -1 {gsub(/-1.0/, "-1", $12); gsub(/-1.0/, "-1", $18); print $12, $18}' "$input_file" > "$output_file"

# Подсчет строк в новом файле
total_lines_after=$(wc -l < "$output_file")

echo "Количество строк в исходном файле: $total_lines_before"
echo "Количество строк в новом файле: $total_lines_after"
echo "Файл $output_file создан успешно."

