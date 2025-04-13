use world;

# 1. Вывести количество городов для каждой страны. Результат должен содержать CountryCode,
# CityCount (количество городов в стране). Поменяйте запрос с использованием джойнов так,
# чтобы выводилось название страны вместо CountryCode.

select countrycode, count(id) as citycount
from city
group by countrycode;

select co.name, count(id) as citycount
from city ci
join country co on ci.countrycode = co.code
group by co.name;

# 2. Используя оконные функции, вывести список стран с продолжительностью жизнью и средней продолжительностью жизни.

select name, lifeexpectancy, avg(lifeexpectancy) over () as avg_lifeexpectancy
from country;

# 3. Используя ранжирующие функции, вывести страны по убыванию продолжительности жизни.

select name, lifeexpectancy, rank() over (order by lifeexpectancy desc) as rank_life
from country;

# 4. Используя ранжирующие функции, вывести третью страну с самой высокой продолжительностью жизни.

select name, lifeexpectancy
from (select name, lifeexpectancy,
    rank() over (order by lifeexpectancy desc) as rank_life
    from country
) as ranked
where rank_life = 3;