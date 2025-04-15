create database taxi_service;
use taxi_service;

# таблица клиентов
create table clients (
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    phone_number varchar(20),
    address text,
    reg_date date
);

# таблица водителей
create table drivers (
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    license_number varchar(30),
    issue_license_date date
);

# таблица автомобилей
create table autos (
    id int primary key auto_increment,
    model_name varchar(100),
    production_year int,
    color varchar(30),
    country varchar(50),
    class varchar(30)
);

# таблица расписания
create table schedule (
    id int primary key auto_increment,
    driver_id int references drivers(id),
    begin datetime,
    end datetime,
    auto_id int references autos(id)
);

# таблица заказов
create table orders (
    id int primary key auto_increment,
    date_time datetime,
    status varchar(20),
    client_id int references clients(id),
    driver_id int references drivers(id),
    departure text,
    arrival text
);