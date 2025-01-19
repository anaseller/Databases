USE 091224ptm_Ana;

#1
CREATE TABLE weather (
    city VARCHAR(50),
    forecast_date DATE,
    temperature INTEGER
);

#2
SELECT *
FROM weather;

#3
INSERT INTO weather (city, forecast_date, temperature)
VALUES ('Berlin', '2023-08-29', 30);

#4
INSERT INTO weather (city, forecast_date, temperature)
VALUES
    ('Paris', '2023-08-28', 25),
    ('Madrid', '2023-08-30', 35),
    ('Rome', '2023-09-01', 28);

#5
SELECT *
FROM weather;

#6
UPDATE weather
SET temperature = 26
WHERE city = 'Berlin' AND temperature = 30;

#7
UPDATE weather
SET city = 'Paris'
WHERE temperature > 25;

#8
ALTER TABLE weather
ADD COLUMN min_temp INTEGER;

#9
UPDATE weather
SET min_temp = 0;