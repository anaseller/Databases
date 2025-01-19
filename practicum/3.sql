use 091224ptm_Ana;

create table Schedule (
    subject varchar(255),
    teacher varchar(255),
    date date,
    pair_number int
);

drop table Schedule;

insert into Schedule (subject, teacher, date, pair_number)
values
('Programming', 'Professor Smith', '2025-01-06', 1),
('Programming', 'Professor Smith', '2025-01-06', 2),
('Mathematics', 'Professor Anderson', '2025-01-07', 1),
('Mathematics', 'Professor Anderson', '2025-01-07', 2),
('Literature', 'Professor Weber', '2025-01-08', 1),
('Literature', 'Professor Weber', '2025-01-08', 2),
('Programming', 'Professor Smith', '2025-01-09', 1),
('Programming', 'Professor Smith', '2025-01-09', 2),
('Mathematics', 'Professor Anderson', '2025-01-10', 1),
('Mathematics', 'Professor Anderson', '2025-01-10', 2);

alter table Schedule add column start_time varchar(5);

update Schedule set start_time = '9.30' where pair_number = 1;
update Schedule set start_time = '11.00' where pair_number = 2;

alter table Schedule modify column start_time time;

select * from Schedule order by date asc;

update Schedule set subject = 'Fitness' where subject = 'Literature';

commit;
