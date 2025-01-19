USE 091224ptm_Ana;

# добавим 4 товара
INSERT INTO goods (title, quantity)
VALUES
    ('Телефон', 30),
    ('Ноутбук', 75),
    ('Книга', 15),
    ('Велосипед', 40);

# добавим новый столбец
ALTER TABLE goods ADD COLUMN in_stock CHAR(1);

# Устанровить значение 'Y' дл всех товаров с количеством меньше 50
UPDATE goods SET in_stock = 'Y' WHERE quantity < 50;

# Установить значение 'N' для всех оставльных записей
UPDATE goods SET in_stock = 'N' WHERE quantity >= 50;

# Поменять тип поля quantity на numeric(8, 2)
ALTER TABLE goods MODIFY COLUMN quantity NUMERIC(8, 2);

# сортируем
SELECT * FROM goods
ORDER BY in_stock ASC;

# меняем значение "Велосипед" на "Bicycle"
UPDATE goods
SET title = 'Oranges'
WHERE title = 'Апельсин';