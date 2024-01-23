create database lms1;
create table groups
(
    id         serial primary key,
    group_name varchar
);

insert into groups(group_name)
values ('Java-12'),
       ('JS-12'),
       ('English'),
       ('Python-1'),
       ('PM-1');

insert into groups(group_name)
values ('PHP'),
       ('TS');


create table courses
(
    id            serial primary key,
    course_name   varchar,
    date_of_start date,
    group_id      int references groups (id)
);

insert into courses(course_name, date_of_start, group_id)
values ('Java', '2023-10-3', 1),
       ('Js', '2023-10-3', 2),
       ('Python', '2023-4-12', 4),
       ('JS kids', '2022-1-1', 2),
       ('Scratch', '2022-1-1', 1),
       ('Python kids', '2021-3-1', 4),
       ('Technical English', '2020-1-1', 3);

select * from courses;

insert into courses (course_name, date_of_start, group_id)
values ('SoftSkills', '2020-12-12', null);


create table mentors
(
    id             serial primary key,
    first_name     varchar,
    last_name      varchar,
    gender         varchar, -- add check
    email          varchar, -- add unique
    specialization varchar,
    experience     int,
    course_id      int references courses (id)
);

insert into mentors(first_name, last_name, gender, email, specialization, experience, course_id)
values ('Aijamal', 'Asangazieva', 'Female', 'aijamal@gmail.com', 'Java and Python instructor', 2, 1),
       ('Datka', 'Mamatzhanova', 'Female', 'datka@gmail.com', 'Java mentor', 1, 1),
       ('Aijamal', 'Asangazieva', 'Female', 'aijamal@gmail.com', 'Java and Python instructor', 2, 3),
       ('Ainazik', 'Toktomamatova', 'Female', 'ainazik@gmail.com', 'English teacher', 5, 4),
       ('Ulan', 'Kybanychbekov', 'Male', 'ulan@gmail.com', 'JS mentor', 3, 2),
       ('Aizhan', 'Nurmatova', 'Female', 'aizhan@gmail.com', 'PM', 1, null),
       ('Nurisa', 'Mamiraimova', 'Female', 'nurisa@gmail.com', 'Java mentor', 1, null);


create table students
(
    id            serial primary key,
    first_name    varchar,
    last_name     varchar,
    date_of_birth date,
    gender        varchar, -- add check
    email         varchar, -- add unique
    group_id      int references groups (id)
);

insert into students(first_name, last_name, date_of_birth, gender, email, group_id)
values ('Aizat', 'Duisheeva', '2003-3-13', 'Female', 'aizat@gmail.com', 1),
       ('Ainazik', 'Amangeldieva', '2002-2-2', 'Female', 'ainazik12@gmail.com', 1),
       ('Elizar', 'Aitbekov', '2001-9-9', 'Male', 'elizar@gmail.com', 2),
       ('Bektur', 'Kanybekov', '2000-1-9', 'Male', 'bektur@gmail.com', 2),
       ('Daniel', 'Kamilzhanov', '2004-9-23', 'Male', 'daniel@gmail.com', 2),
       ('Torogeldi', 'Niyazbekov', '2007-3-9', 'Male', 'torogeldi@gmail.com', 1),
       ('Sanzhar', 'Abdymomunov', '1999-9-9', 'Male', 'sanzhar@gmail.com', 1),
       ('Bermet', 'Aitbekova', '1996-6-9', 'Female', 'bermet@gmail.com', 2),
       ('Aziza', 'Arzykulova', '1991-1-31', 'Female', 'aziza@gmail.com', 3),
       ('Kamcybek', 'Kuzobaev', '1994-6-22', 'Male', 'kamchybek@gmail.com', null),
       ('Den', 'Garden', '1970-6-24', 'Male', 'den@gmail.com', 4),
       ('Jay', 'Bird', '1980-6-9', 'Male', 'jay@gmail.com', 4),
       ('RM', 'Kim', '1994-9-12', 'Male', 'rm@gmail.com', 4),
       ('J-Hope', 'Jung', '1994-2-18', 'Male', 'jhope@gmail.com', 4),
       ('Daniella', 'Park', '2005-2-14', 'Female', 'daniella@gmail.com', 4),
       ('Jennie', 'Kim', '1996-1-9', 'Female', 'jennie@gmail.com', null),
       ('Lisa', 'Monoban', '1996-3-27', 'Female', 'lalisa@gmail.com', 4),
       ('Adinai', 'Sharshekeeva', '1992-7-12', 'Female', 'adinai@gmail.com', 3),
       ('Rose', 'Park', '2006-7-12', 'Female', 'rose@gmail.com', 5),
       ('Aikezhan', 'Akhamatova', '1992-1-12', 'Female', 'aikezhan@gmail.com', 5),
       ('Mirbek', 'Nazhmidinov', '2007-12-31', 'Male', 'mirbek@gmail.com', 5),
       ('Aikeldi', 'LastName', '1998-7-12', 'Female', 'aikeldi@gmail.com', 5);




create table lessons
(
    id          serial primary key,
    lesson_name varchar,
    course_id   int references courses (id)
);

insert into lessons(lesson_name, course_id)
values ('SQL', 1),
       ('Git', 1),
       ('ArrayList', 1),
       ('LinkedList', 1),
       ('Stream', 1),
       ('HTML', 2),
       ('CSS', 2),
       ('UI-UX', null),
       ('Teg', 2),
       ('Verbs', 4),
       ('Noun', 4),
       ('Adjective', 4),
       ('Adverb', 4),
       ('sout', 3);

-- Group:
-- Получите все записи таблицы groups;
select *
from groups;
-- Получите общее количество записей таблицы groups
select count(*)
from groups;
--  Выведите группы их курсы
select *
from courses c
         inner join groups g on c.id = g.id;
-- Выведите курсы групп у которых курс начался с 2020-1-1 по 2023-3-3
select *
from groups g
         inner join courses c on g.id = c.group_id
where date_of_start between '2020.1.1' and '2023.3.3';
select*
from courses;
-- Выведите имена, дату рождения студентов , которые родились с 1980-1-1 по 2004-12-12, и название группы
select first_name, date_of_birth, group_name
from students s
         inner join groups g on s.group_id = g.id
where date_of_birth between '1980.1.1' and '2004-12-12';
-- Выведите суммарный возраст всех студентов курса 'Python'
--     select sum(extract(year from now()) - extract(year from date_of_birth )) as age_sum from courses c inner join groups g on g.id = group_id inner join students on c.group_id = g.id where course_name = 'Python';
select sum(extract(year from now()) - extract(year from date_of_birth))
from courses c
         inner join groups g on g.id = c.group_id
         inner join students s on g.id = s.group_id
where 'Python' = c.course_name;
-- Вывести полное имя, возраст, почту студентов и название группы, где айди группы равен 3
select concat(first_name, ' ',last_name) as full_name,
       extract(year from now()) - extract(year from date_of_birth),
       s.email,
       g.group_name
from students s
         inner join groups g on g.id = s.group_id where group_id = 3;
-- Вывести все курсы одной группы, где название группы 'Java-12'
select * from courses c inner join groups g on c.group_id = g.id where group_name ='Java-12';
-- Вывести название всех групп и количество студентов в группе
select group_name ,count(*) from groups g inner join students s on g.id = s.group_id group by group_name ;
-- Вывести название всех групп и количество студентов в группе, если в группе больше 4 студентов
select group_name ,count(*) from groups g inner join students s on g.id = s.group_id group by group_name having count(s.id) > 2;

-- Отсортируйте имена студентов группы по убыванию, где айди группы равна 4 и выведите айди студента, имя, пол и название группы
select s.id,first_name,gender,group_name from students s inner join groups g on s.group_id = g.id where g.id = 4 order by first_name desc ;


--Course:
-- Вывести все курсы
select * from courses;
-- Вывести все уроки курса 'Technical English'
select * from courses c inner join lessons l on l.course_id = c.id where course_name ='Technical English';
select * from lessons;
-- Вывести количество всех студентов курса id = 4
select count(*) from students s inner join courses c on s.group_id = c.group_id where c.id = 4;
-- Вывести имя, почту, специализацию ментора и название курса где курс айди равен 2
select first_name,email,specialization from mentors m inner join courses c on m.course_id = c.id where c.id = 2;
-- Посчитить сколько менторов в каждом курсе
select course_name,count(m.id) from courses c inner join mentors m on c.id = m.course_id  group by course_name;
-- Сгруппируйте и посчитайте менторов в каждом курсе и выведите только те курсы, где в курсе больше 2
select course_name,count(m.id) from courses c inner join mentors m on c.id = m.course_id  group by course_name having m.count  >=2;
-- Вывести название, дату и полное имя ментора, все курсы которые начинаются с 2020-1-1 по 2023-3-3
select course_name,date_of_start,first_name,last_name from courses c  inner join mentors m on c.id = m.course_id where date_of_start between '2020.1.1' and '2023.3.3';
-- Вывести имя, почту, возраст студентов курса 'Java'
select first_name,email,date_of_birth,course_name  from students s inner join courses c on s.group_id = c.group_id where course_name = 'Java';
-- Вывести тот курс у где нет ментора
select * from courses c left join mentors m on c.id = m.course_id where m.id is null;
-- Вывести тот курс у где нет уроков
select * from courses c left join lessons l on c.id = l.course_id where l.id is null;
-- Вывести тот курс у где нет студентов
select * from courses c left join students s on c.id = s.group_id where s.group_id is null;

-- Students:
-- Вывести общее количество студентов
select count(*) from students;
-- Вывести общее количество студентов, которым 18 и старше
select count(*) from students where extract(year from now()) - extract(year from date_of_birth) >= 18;
-- Вывести имя, почту и пол студента, айди группы которого равна 2
select s.first_name,s.email,s.gender ,s.id from students s inner join groups g on s.group_id = g.id where s.group_id = 2;
-- Вывести суммарный возраст всех студентов, которые младше 20
select sum(extract(year from now()) - extract(year from date_of_birth))  from students where extract(year from now()) - extract(year from date_of_birth) < 20 ;
-- Вывести группу студента, айди которого равна 4
select * from students s inner join groups g on s.group_id = g.id where g.id =4;
-- Сгруппируйте студентов по gender и выведите общее количество gender
select students.gender, count(students.gender) from students group by gender;
-- Найдите студента с айди 8 и обновите его данные
update students set first_name='Myrzash',last_name ='Keldibekova' where id = 8;
select*from students where id = 8;
-- Найдите самого старшего студента курса, айди курса которого равна 5
select  max(extract(year from now()) - extract(year from date_of_birth)) from students s inner join courses c on s.group_id = c.group_id where c.id =5;
select * from students s inner join courses c on s.group_id = c.group_id ;
-- Добавьте unique constraint email в столбец таблицы students
alter table students add constraint email unique (email);
-- Добавьте check constraint gender в столбец таблицы mentors
alter table mentors add constraint gender check  (gender in ('Male','Female'));
-- Добавьте check constraint gender в столбец таблицы students
alter table students add constraint gender check  (gender in ('Male','Female'));
-- Переименуйте таблицу mentors в instructors
alter table mentors rename to instructors;


-- Mentors:
-- Вывести имя, почту и специализацию ментора группы 'Java-9'
select m.first_name,m.email,m.specialization from instructors m inner join groups g on m.id = g.id where group_name = 'Java-9';
select * from groups;
-- Вывести всех менторов, чей опыт превышает 1 год
select * from instructors where experience > 1;
-- Вывести ментора у которого нет курса
select * from instructors where course_id is null;
select * from instructors i left join courses c on i.course_id = c.id where c.id is null;
-- Вывести айди, имя ментора и его студентов
select m.id,m.first_name,m.last_name,s.first_name,s.last_name from instructors m inner join courses c on m.course_id = c.id inner join students s on c.group_id = s.group_id;
-- Посчитать сколько студентов у каждого ментора, и вывести полное имя ментора и количество его студентов
select i.first_name,count(i.id) from instructors i inner join courses c on i.course_id = c.id inner join students s on c.group_id = s.group_id group by i.first_name;
-- Вывести ментора у которого нет студентов
select * from instructors i left join courses c on i.course_id = c.id left join students s on c.group_id = s.group_id where s.group_id is null;
-- Вывести ментора у которого студентов больше чем 2
select i.first_name,count(i.id) from instructors i left join courses c on i.course_id = c.id left join students s on c.group_id = s.group_id group by i.first_name having i.count > 4;
-- Вывести курсы ментора с айди 5
select * from courses c inner join instructors m on c.id = m.course_id where m.id = 5;
-- Вывести все уроки ментора, айди которого равен 5
select * from instructors i inner join lessons l on i.course_id = l.course_id where i.id = 5;



-- Lesson:
-- Вывести все уроки
select * from lessons;
-- Получить все уроки студента, айди которого равен 2
select * from lessons l inner join courses c on l.course_id = c.id inner join groups g on c.group_id = g.id inner join students s on g.id = s.group_id where s.id = 2;
-- Посчитать уроки каждой группы и вывести название группы и количество уроков, где количество уроков больше чем 2
select g.group_name ,count(l.id) from lessons l inner join courses c on l.course_id = c.id inner join groups g on c.group_id = g.id group by g.group_name having l.count >= 1;
-- Отсортировать уроки студента по названию, где айди студента равна 7
select * from lessons l inner join courses c on l.course_id = c.id inner join groups g on c.group_id = g.id inner join students s on g.id = s.group_id where s.id = 7 order by l.lesson_name;
-- Получить все уроки курса, где название курса 'Python kids'
select * from lessons l inner join courses c on c.id = l.course_id where l.lesson_name = 'Python Kids';
-- Получить все уроки ментора, айди которого равен 5
select * from instructors i inner join lessons l on i.course_id = l.course_id where i.id = 5;