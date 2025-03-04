# Подключитесь к базе данных world (которая находится на удаленном сервере).
use world;


# Выведите список стран с языками, на которых в них говорят.

select c.name as Country, l.language
from country c
join countrylanguage l on c.Code = l.CountryCode;

# Выведите список городов с их населением и названием стран

select c.name as city, c.population, cc.name AS country
from city c
join country cc on c.countrycode = cc.code;

# Выведите список городов в South Africa

select name
from city
where countrycode = (select code from country where name = 'South Africa');

# Выведите список стран с названиями столиц. Подсказка: в таблице country есть поле Capital,
# которое содержит номер города из таблицы City.

select cc.name as country, c.name as capital
from country cc
join city c on cc.capital = c.ID;

# Измените запрос 4 таким образом, чтобы выводилось население в столице.

select cc.name as country, c.Name as capital, c.population as capital_population
from country cc
join city c on cc.capital = c.ID;

# Напишите запрос, который возвращает название столицы United States

select name
from city
where ID = (select capital from country where name = 'United States');

# Используя базу hr_data.sql, вывести имя, фамилию и город сотрудника.
use hr;
select e.first_name, e.last_name, l.city
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

# Используя базу hr_data.sql, вывести города и соответствующие городам страны.

select l.city, c.country_name as country
from locations l
join countries c on l.country_id = c.country_id;