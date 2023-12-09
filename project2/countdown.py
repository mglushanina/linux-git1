# -*- coding: utf-8 -*-

import datetime

def time_until_new_year():
    # Получаем текущую дату и время
    now = datetime.datetime.now()

    # Получаем год следующего Нового года
    current_year = now.year
    next_year = current_year + 1

    # Устанавливаем дату Нового года текущего года
    new_year_date = datetime.datetime(next_year, 1, 1)

    # Вычисляем разницу во времени
    time_left = new_year_date - now

    return time_left

def main():
    # Получаем оставшееся время до Нового года
    time_left = time_until_new_year()

    # Выводим оставшееся время
    print("До Нового года осталось всего: {}".format(time_left))

if __name__ == "__main__":
    main()

