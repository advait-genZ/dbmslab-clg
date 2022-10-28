create database studco;
use studco;

create table course
(course_id int primary key,
c_name varchar(20),
fee decimal(6,2),
duration int);

create table student
(roll_no int,
name varchar(15),
dob date,
cid int not null,

foreign key(cid) references course(course_id));

insert into course values
(1, "Btech",7000.79,4),
(2,"Mtech",9700.23,2),
(3,"BSW",6799.25,3),
(4,"MSW",8434.56,2);

insert into student values
(01,"Ravi",'2004-06-12',1),
(02,"Rajan",'2001-12-21',4),
(03,"John",'2002-02-07',2),
(04,"Babu",'2005-01-05',3),
(05,"Shibu",'2001-01-01',4),
(06,"Remenen",'2003-07-25',2),	
(07,"Advait",'2003-10-27',1),
(08,"Satheeshan",'2002-05-18',1),
(09,"Shaji",'2000-12-19',2),
(10,"Divakaran",'2002-04-27',2),
(07,"Advait",'2003-10-27',4),
(04,"Babu",'2005-01-05',1),
(06,"Remenen",'2003-07-25',4),
(02,"Rajan",'2001-12-21',2),	
(01,"Ravi",'2004-06-12',4);

/*1*/
select name 
from student
where dob < '2003-12-12' and cid = 1;

/*2*/
select * 
from course
where fee>(select fee
	   from course
	   where c_name="Btech");

/*3*/
select roll_no,name,dob,count(*) as "no_of_courses"
from student
group by roll_no,name,dob
having count(*)>1;

/*4*/
select *
from course
into @v1;

select @v1
from student

drop table student;
drop table course;
drop database studco;
