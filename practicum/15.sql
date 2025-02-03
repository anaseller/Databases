select name
from customers
where city = 'Berlin'


# Чтобы вывести все заказы с дополнительным столбцом процент_скидки,
# который содержит разницу в процентах между нормальной и скидочной ценой,
# можно использовать следующий запрос. Предположим, таблица называется Orders
# и имеет поля order_id, normal_price (нормальная цена) и discount_price (скидочная цена).
#
# SELECT
#     order_id,
#     normal_price,
#     discount_price,
#     ((normal_price - discount_price) / normal_price) * 100 AS процент_скидки
# FROM Orders;

# 	1.	normal_price - discount_price — разница между нормальной и скидочной ценой.
# 	2.	Делим разницу на normal_price, чтобы получить долю скидки.
# 	3.	Умножаем результат на 100, чтобы преобразовать в проценты.
# 	4.	Дополнительно добавляем этот вычисляемый столбец с названием процент_скидки.

select *, round((good_price - discounter_price)/good_price, 2) as disc_size
from orders
