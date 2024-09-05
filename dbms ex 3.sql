create database university_db;
use university_db;

create table Students (
student_id int primary key,
student_name varchar(30) not null,
age int check(age>17)
);
create table Courses(
course_id int primary key,
course_name varchar(30) not null,
credits int check(credits>0)
);
create table Instructors(
instructor_id int primary key,
instructor_name varchar(30) not null,
department varchar(30) not null
);
create table Enrolments( 
enrolment_id int primary key,
student_id int,
course_id int,
instructor_id int,
enrolment_date date,

foreign key (student_id) references Students(student_id),
foreign key (course_id) references Courses(course_id),
foreign key(instructor_id) references Instructors(instructor_id)
);

select s.student_id, s.student_name, s.age from Students s
join Enrolments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id
join Instructors i on e.instructor_id = i.instructor_id
where c.course_name in ('DBMS','Python Programming') and i.department = 'CS';

select s.student_id, s.student_name, s.age from Students s
join Enrolments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id
join Instructors i on e.instructor_id = i.instructor_id
where i.department = 'Banking Technology';

select s.student_id, s.student_name, s.age from Students s
left join Enrolments e on s.student_id = e.student_id
left join Courses c on e.course_id = c.course_id; 

select s.student_id, s.student_name, c.course_id, c.course_name, e.enrolment_date from Students s
left join Enrolments e on s.student_id = e.student_id
left join Courses c on e.course_id = c.course_id;

select  c.course_id, c.course_name,  s.student_id, s.student_name from Courses c
left join Enrolments e on c.course_id = e.course_id
left join Students s on e.student_id = s.student_id;


insert into Students(student_id,student_name,age) values
(101,'Arshad',21),
(102,'Rizwan',21),
(103,'Thaju',21),
(104,'Faheem',22);

insert into Students(student_id,student_name,age) values
(105,'Fazal',22);

insert into Courses(course_id,course_name,credits) values
(201,'DBMS',3),
(202,'Python Programming',3),
(203,'Banking Technology',3),
(204,'Machine learning',3);

insert into Instructors(instructor_id,instructor_name,department) values
(301,'Angel','CS'),
(302,'Tinku','CS'),
(303,'Angel','Banking Technology'),
(304,'Dr.Raju','Machine Learning');

insert into Enrolments(enrolment_id,student_id,course_id,instructor_id,enrolment_date) values
(001,101,201,301,'2024-06-15'),
(002,102,202,302,'2024-07-05'),
(003,103,203,303,'2024-07-11'),
(004,104,204,304,'2024-08-25');








 
