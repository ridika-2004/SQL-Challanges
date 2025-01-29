use mydb;

insert into employee
values (1, "anakin", "skywalker", 30.00, "2025-01-29"),
(2, "obi-wan", "kenobi", 25.00, "2025-01-29"),
(3, "padme", "amidala", 30.00, "2025-01-29"),
(4, "darth", "sidius", 40.00, "2025-01-29"),
(5, "master", "windu", 20.00, "2025-01-29");

insert into employee (employee_id,first_name,last_name)
values (6, "darth", "ridika");

select*from employee;