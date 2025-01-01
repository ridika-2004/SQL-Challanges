create table research_group (
    group_id int primary key,
    group_name varchar(100),
    lab varchar(100),
    budget decimal(10,2),
    group_head_id int,
    foreign key (group_head_id) references faculty(faculty_id)
);

create table faculty (
    faculty_id int primary key,
    name varchar(100),
    contact_number varchar(15),
    research_lab varchar(100),
    foreign key (group_id) references research_group(group_id)
);

create table student (
    student_id int primary key,
    name varchar(100),
    contact_number varchar(15),
    group_id int,
    supervisor_id int,
    foreign key (group_id) references research_group(group_id),
    foreign key (supervisor_id) references faculty(faculty_id)
);

create table research_project (
    project_title varchar(255),
    start_date date,
    estimated_end_date date,
    research_domain varchar(100),
    research_lab varchar(100),
    foreign key (research_lab) references research_group(group_id)
);

create table publication_authors (
f_id int primary key,
s_id int primary key,
foreign key(f_id) references faculty(faculty_id),
foreign key(s_id) references student(student_id)
);

create table publication (
    publication_id int primary key,
    title varchar(255),
    conference_name varchar(100),
    publication_date date,
    research_domain varchar(100),
    summary varchar(1000),
    research_lab varchar(100),
    author_id varchar(50),
    foreign key(research_lab) references research_lab(group_id),
    foreign key(author_id) references publication_authors(f_id,s_id)
);

drop table research_group;
drop table faculty;
drop table student;
drop table research_project;
drop table publication_auhtors;
drop table publication;