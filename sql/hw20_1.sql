use sakila;

# 1. Вывести названия фильмов с расшифровкой рейтинга для каждого. Рейтинги описаны здесь.
# В таблице film хранятся годы рейтингов. Нужно воспользоваться оператором case чтобы определить
# для каждого кода условие, по которому будет выводится его развернутое описание (1 предложение).
select title, rating,case rating
when 'G' then 'допущены все возрастные категории'
when 'PG' then 'рекомендуется присутствие родителей'
when 'PG-13' then 'некоторые материалы неприемлемы для детей до 13 лет'
when 'R' then 'дети до 17 лет должны быть с родителями'
when 'NC-17' then '18+'
else 'неизвестный рейтинг'
end as rating_description
from film;


# 2.Выведите количество фильмов в каждой категории рейтинга. Используем group by.

select rating, count(*) as film_count
from film
group by rating;

# 3.Используя оконные функции и partition by, выведите список названий фильмов,
# рейтинг и количество фильмов в каждом рейтинге. Объясните, чем отличаются результаты
# предыдущего запроса и запроса в этой задаче.

select title, rating, count(*) over (partition by rating) as films_in_rating
from film;

# group by возвращает группу в одной строке, а partition by сохраняет все строки и добавляет колонку без группировки



# 4.Изучите таблицы payment и customer. Выведите список всех платежей с указанием имени и фамилии каждого заказчика,
# датой платежа и суммой.

select p.payment_id, c.first_name, c.last_name, p.payment_date, p.amount
from payment p
join customer c on p.customer_id = c.customer_id;

# 5.Поменяйте предыдущий запрос так, чтобы дата выводилась в формате “число, название месяца, год” (без времени).

select p.payment_id, c.first_name, c.last_name, date_format(p.payment_date, '%e %M %Y') as formatted_date, p.amount
from payment p
join customer c on p.customer_id = c.customer_id;