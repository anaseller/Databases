# Подключитесь к базе данных hr (которая находится на удаленном сервере).
use hr;

# Выведите количество сотрудников в базе
select count(*) as employee_count from employees;

# Выведите количество департаментов (отделов) в базе
select count(*) as department_count from departments;

# Подключитесь к базе данных World (которая находится на удаленном сервере).
use world;

# Выведите среднее население в городах Индии (таблица City, код Индии - IND)
select avg(population) as avg_population
from city
where countrycode = 'IND';

# Выведите минимальное население в индийском городе и максимальное.
select min(population) as min_population,
       max(population) as max_population
from city
where countrycode = 'IND';

# Выведите самую большую площадь территории.
select name, surfacearea
from country
order by surfacearea desc
limit 1;

# Выведите среднюю продолжительность жизни по странам.
select avg(lifeexpectancy)
from country
where lifeexpectancy is not null;

# Найдите самый населенный город (подсказка: использовать подзапросы)
select name, population
from city
where population = (
    select max(population) from city
);