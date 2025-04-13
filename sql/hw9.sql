# Вывести текущую дату и время.
select now();

# Вывести текущий год и месяц
select date_format(current_date, '%y %m') as year_mount;

# Вывести текущее время
select current_time;

# Вывести название текущего дня недели
select dayname(now()) as weekday_name;

# Вывести номер текущего месяца
select month(now()) as current_month;

# Вывести номер дня в дате “2020-03-18”
select extract(day from '2020-03-18') as day_number;

# Подключиться к базе данных shop (которая находится на удаленном сервере).
use shop;

# Определить какие из покупок были совершены апреле (4-й месяц)
select *
from ORDERS
where month(odate) = 4;

# Определить количество покупок в 2022-м году
select count(*) as orders_count
from ORDERS
where year(odate) = 2022;

# Определить, сколько покупок было совершено в каждый день.
# Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - дату и количество покупок
select odate, count(*) as orders_count
from ORDERS
group by odate
order by orders_count asc;

# Определить среднюю стоимость покупок в апреле
select avg(amt) as avg_april_amount
from ORDERS
where month(odate) = 4;