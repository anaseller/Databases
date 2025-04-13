# Подключитесь к базе данных Students (которая находится на удаленном сервере).
use students;

# Найдите самого старшего студента
select *
from Students
order by age desc
limit 1;

# Найдите самого старшего преподавателя
select *
from Teachers
order by age desc
limit 1;

# Выведите список преподавателей с количеством компетенций у каждого
select t.id, t.name, count(c.competencies_id) as competency_count
from Teachers t
left join Teachers2Competencies c on t.id = c.teacher_id
group by t.id, t.name;

# Выведите список курсов с количеством студентов в каждом
select c.id, c.title, count(s.student_id) as student_count
from Courses c
left join Students2Courses s on c.id = s.course_id
group by c.id, c.title;

# Выведите список студентов, с количеством курсов, посещаемых каждым студентом.
select s.id, s.name, count(sc.course_id) as course_count
from Students s
left join Students2Courses sc on s.id = sc.student_id
group by s.id, s.name;