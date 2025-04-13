# Подключиться к базе данных world
use world;

# Вывести население в каждой стране. Результат содержит два поля: CountryCode, sum(Population).
# Запрос по таблице city.
select countrycode, sum(population) as total_population
from city
group by countrycode;

# Изменить запрос выше так, чтобы выводились только страны с населением более 3 млн человек.
select countrycode, sum(population) as total_population
from city
group by countrycode
having sum(population) > 3000000;

# Сколько всего записей в результате?
select count(*)
from (select countrycode
  from city
  group by countrycode
  having sum(population) > 3000000
) as sub;

# Поменять запрос выше так, чтобы в результате вместо кода страны выводилось ее название.
# Подсказка: нужен join таблиц city и country по полю CountryCode.
select co.name, sum(ci.population) as total_population
from city ci
join country co on ci.countrycode = co.code
group by co.name
having sum(ci.population) > 3000000;

# Вывести количество городов в каждой стране (CountryCode, amount of cities).
# Подсказка: запрос по таблице city и группировка по CountryCode.
select countrycode, count(*) as amount_of_cities
from city
group by countrycode;

# Поменять запрос так, чтобы вместо кодов стран, было названия стран.
select co.name, count(*) as amount_of_cities
from city ci
join country co on ci.countrycode = co.code
group by co.name;

# Поменять запрос так, чтобы выводилось среднее количество городов в стране.
# Подсказка: разделите задачу на несколько подзадач.
# Например, сначала вывести код страны и количество городов в каждой стране.
# Вывести код страны и количество городов в каждой стране.
select countrycode, count(*) as amount_of_cities
from city
group by countrycode;

# Затем сделать join получившегося результата с запросом, где высчитывается среднее от количества городов.
#  Получить среднее количество городов в стране.
select avg(amount_of_cities) as avg_amount_of_cities
from (
  select countrycode, count(*) as amount_of_cities
  from city
  group by countrycode
) as sub;

# Потом добавить join, который добавит имена стран, вместо кода.
# Объединить результаты с именами стран.
select co.name, sub.amount_of_cities, avg_table.avg_amount_of_cities
from (
  select countrycode, count(*) as amount_of_cities
  from city
  group by countrycode
) as sub
join country co on sub.countrycode = co.code
join (
  select avg(amount_of_cities) as avg_amount_of_cities
  from (
    select countrycode, count(*) as amount_of_cities
    from city
    group by countrycode
  ) as inner_sub
) as avg_table;
