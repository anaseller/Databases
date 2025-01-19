#1

SELECT first_name, last_name
FROM hr.employees;

#2

SELECT salary
FROM hr.employees;

#3

SELECT
    CASE
        WHEN salary > 10000 THEN 1
        ELSE 0
    END AS SALARY_GROUP
FROM hr.employees;

#4
# выводится один столбец, поскольку запрос выбирает только результат вычислений из CASE/WHEN,
# без других полей, тк другие поля не указаны

#5
SELECT first_name,
    CASE
        WHEN salary > 10000 THEN 1
        ELSE 0
    END AS SALARY_GROUP
FROM hr.employees;

#6

SELECT
    AVG(CASE
            WHEN department_id IN (60, 90, 100) THEN salary
            ELSE NULL
        END) AS avg_salary
FROM hr.employees;

#7

SELECT
    first_name, last_name,
    CASE
        WHEN salary < 10000 THEN 'junior'
        WHEN salary BETWEEN 10000 AND 15000 THEN 'mid'
        WHEN salary > 15000 THEN 'senior'
    END AS level
FROM hr.employees;

#8

SELECT
    job_id,
    CASE
        WHEN max_salary > 10000 THEN 'high_payer'
        ELSE 'low_payer'
    END AS payer_rank
FROM hr.jobs;

#9

SELECT
    job_id,
    IF(max_salary > 10000, 'high_payer', 'low_payer') AS payer_rank
FROM hr.jobs;

#10

SELECT
    job_id, max_salary,
    CASE
        WHEN max_salary > 10000 THEN 'high_payer'
        ELSE 'low_payer'
    END AS payer_rank
FROM hr.jobs
ORDER BY max_salary DESC;