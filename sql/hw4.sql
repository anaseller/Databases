
# 1. Вывести все заказы, отсортированные по убыванию по стоимости

SELECT *
FROM orders
ORDER BY good_price DESC;

# 2. Вывести всех заказчиков, у которых почта зарегистриварована на gmail.com

SELECT *
FROM customers
WHERE email like '%@gmail.com';

# 3. Вывести заказы, добавив дополнительный вычисляемый столбец status, который
# вычисляется по стоимости заказа и имеет три значения: low, middle, high.

SELECT *,
       CASE
           WHEN good_price < 100 THEN 'low'
           WHEN good_price < 500 THEN 'middle'
           WHEN good_price >= 501 THEN 'high'
           ELSE NULL
           END AS status
FROM orders;

# 4. Вывести заказчиков по убыванию рейтинга.

SELECT *
FROM customers
ORDER BY rating DESC;

# 5. Вывести всех заказчиков из города на ваш выбор.

SELECT *
FROM customers
WHERE city = 'Berlin';


# 6. Написать запрос, который вернет самый часто продаваемый товар.

SELECT good_id, SUM(good_count) AS total_sales
FROM orders
GROUP BY good_id
ORDER BY total_sales DESC
LIMIT 1;

# 7. Вывести список заказов с максимальной скидкой.

SELECT *
FROM orders
WHERE discounter_price = (SELECT MAX(discounter_price) FROM orders);

# 10. Написать запрос, который выведет все заказы с дополнительным столбцом процент_скидки,
# который содержит разницу в процентах между нормальной и скидочной ценой?

SELECT *, ROUND(100 - discounter_price / orders.good_price * 100) AS discount_percent
FROM orders;