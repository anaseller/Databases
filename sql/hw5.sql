# Подключиться к базе данных world (которая находится на удаленном сервере).

use world;

# Посмотреть на таблицы city, country из базы world. В каждой таблице есть поле название (Name) и население (Population). Поле Name в одной таблице означает название города, а в другой - название страны.
# Написать запрос с помощью UNION, который выводит список названий всех городов и стран с их населением. Итоговая выборка должна содержать два столбца: Name, Population.

SELECT Name, Population FROM city
UNION
SELECT Name, Population FROM country;

# Посмотреть на таблицы в базе world и объяснить ограничения нескольких столбцов - ответить 1 предложением.

SHOW CREATE TABLE city;

# Далее работаем на локальном сервере. Создать новую таблицу citizen, которая содержит следующие поля: уникальное автоинкрементное, номер соц страхования, имя, фамилию и емейл.

CREATE TABLE citizen (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ssn VARCHAR(11) UNIQUE,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(100)
);

# На вашем локальном сервере в любой базе создать таблицу без ограничений (любую, можно взять с урока).

CREATE TABLE table_1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    age INT
);

# Добавить в таблицу 5 значений. Добавить 3 человека с одинаковыми именами и 2 человека без lastname

INSERT INTO table_1 (firstname, lastname, age)
VALUES
    ('John', 'Doe', 30),
    ('John', 'Doe', 25),
    ('John', '', 35),
    ('Alice','', 28),
    ('Bob', 'Welter', 22);

# Использовать оператор alter table … modify , чтобы добавить ограничение not null на поле firstname и lastname.

ALTER TABLE table_1
MODIFY firstname VARCHAR(50) NOT NULL,
MODIFY lastname VARCHAR(50) NOT NULL;

# Добавить ограничение unique для пары firstname\lastname.

ALTER TABLE example_table
ADD CONSTRAINT unique_name UNIQUE (firstname, lastname);

# Удалить таблицу из базы и пересоздать ее, модифицировав запрос add table так, чтобы он учитывал ограничения (см примеры из класса).

DROP TABLE table_1;

CREATE TABLE table_2 (
    id INT AUTO_INCREMENT,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    age INT,
    PRIMARY KEY(id),
    CONSTRAINT unique_name UNIQUE (firstname, lastname)
);

# Добавить правильные и неправильные данные (нарушающие и не нарушающие ограничения).
# правильные

INSERT INTO table_2 (firstname, lastname, age)
VALUES
    ('John', 'Doe', 30),
    ('Alice', 'Smith', 25);

# неправильные

INSERT INTO table_2 (firstname, lastname, age)
VALUES ('John', 'Doe', 40);

INSERT INTO table_2 (firstname, lastname, age)
VALUES (NULL, 'Doe', 30);
