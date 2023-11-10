#!/bin/bash

RATING_AVG=$(awk -F"," 'NR>1 {sum += $NF} END {printf "RATING_AVG %.2f", sum/(NR-1)}' /home/users/datasets/hotels.csv)
echo $RATING_AVG
awk -F',' 'NR>1 {country=tolower($7); hotel_count[country]++} END {for (c in hotel_count) print "HOTELNUMBER " c " " hotel_count[c]}' /home/users/datasets/hotels.csv
awk -F, '/hilton|hilton/ {split($1, a, "_"); country=tolower(a[1]); hilton_cleanliness[country]+=$11; hilton_count[country]+=1}
         /holiday_inn/ {split($1, a, "_"); country=tolower(a[1]); holiday_inn_cleanliness[country]+=$11; holiday_inn_count[country]+=1}
         END {for (country in hilton_cleanliness) { 
                  hilton_avg = hilton_cleanliness[country] / hilton_count[country];
                  holiday_inn_avg = holiday_inn_cleanliness[country] / holiday_inn_count[country];
                  printf "CLEANLINESS %s %.2f %.2f\n", country, holiday_inn_avg, hilton_avg
              }
         }' /home/users/datasets/hotels.csv

