k# plot_script.gp

# Установка формата сохраняемого изображения
set terminal pngcairo enhanced font 'Verdana,12'
set output 'linear_regression_plot.png'

# Заголовок графика
set title 'Линейная регрессия: Чистота vs Общая оценка'

# Названия осей
set xlabel 'Общая оценка'
set ylabel 'Чистота'

# Чтение данных из файла CSV с фильтрацией -1 значений
datafile = '/home/users/datasets/hotels.csv'
# Используйте "," как разделитель данных
set datafile separator ","
# Определение модели линейной регрессии
f(x) = a * x + b
# Подгонка данных к модели с фильтрацией -1 значений
fit f(x) datafile using 16:11:(($11 != -1 && $16 != -1) ? $16 : 1/0) via a, b

# Построение данных
plot datafile using 16:11 with points title 'Данные'

# Построение линейной регрессии
replot f(x) title 'Линейная регрессия'

