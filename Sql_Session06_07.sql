--create database CSDL_session06_07
create database CSDL_session06_07;
--create table department
create table department(
    id serial primary key,
	name varchar(50)
);
--create table employee
create table employee(
    id serial primary key,
	full_name varchar(100),
	department_id int,
	salary numeric(10, 2)
);

insert into department (name) values
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Sales'),
('R&D');

insert into employee (full_name, department_id, salary) values
('Nguyễn Văn An', 1, 20000000),
('Trần Thị Bình', 1, 25000000),
('Lê Văn Cường', 2, 12000000),
('Bùi Thị Mai', 2, 13000000),
('Phạm Thị Dung', 3, 30000000),
('Đặng Văn Long', 3, 28000000),
('Hoàng Văn Em', 4, 9000000),  
('Vũ Thị Hoa', 4, 11000000),
('Ngô Văn Nam', 5, 15000000);


--Liệt kê danh sách nhân viên cùng tên phòng ban của họ (INNER JOIN)
select d.name as department_name,
e.full_name,
e.salary
from employee e
inner join department d
on e.department_id = d.id;
/*Tính lương trung bình của từng phòng ban, hiển thị:
department_name
avg_salary
Gợi ý: dùng GROUP BY và bí danh cột
*/
select d.name as depatment_name,
avg(e.salary) as avg_salary
from department d
inner join employee e
on d.id = e.department_id 
group by d_name;
--Hiển thị các phòng ban có lương trung bình > 10 triệu (HAVING)
select d.name as department_name
avg(e.salary) as avg_salary
from department d
inner join employee e
on d.id = e.department_id
group by d.name
having avg(e.salary) > 10000000;
--Liệt kê phòng ban không có nhân viên nào (LEFT JOIN + WHERE employee.id IS NULL)
select d.id, d.name as department_name
from department d
left join employee e
on d.id = e.department_id
where e.id is null;