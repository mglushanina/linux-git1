#!/bin/bash
RATING_AVG=$(awk -F',' 'NR>1 && $NF != -1 {sum += $NF; count++} END {printf "RATING_AVG %.2f", sum/count}' /home/users/datasets/hotels.csv)
echo $RATING_AVG
awk -F',' 'NR>1 && $7 != -1 {country=tolower($7); hotel_count[country]++} END {for (c in hotel_count) print "HOTELNUMBER " c " " hotel_count[c]}' /home/users/datasets/hotels.csv
awk -F, '/hilton|hilton/ && $16 != -1 {country=tolower($7); hilton_cleanliness[country]+=$16; hilton_count[country]+=1}
         /holiday_inn/ && $16 != -1 {country=tolower($7); holiday_inn_cleanliness[country]+=$16; holiday_inn_count[country]+=1}
         END {for (country in hilton_cleanliness) { 
                  if (hilton_count[country] > 0 && holiday_inn_count[country] > 0) {
                      hilton_avg = hilton_cleanliness[country] / hilton_count[country];
                      holiday_inn_avg = holiday_inn_cleanliness[country] / holiday_inn_count[country];
                      printf "CLEANLINESS %s %.2f %.2f\n", country, holiday_inn_avg, hilton_avg
                  }
              }
         }' /home/users/datasets/hotels.csv

