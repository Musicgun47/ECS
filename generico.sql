drop table if exists comp3732_employees;
drop table if exists comp3732_departments;


CREATE TABLE comp3732_departments (
    dept_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    deptName VARCHAR (50),
    deptType VARCHAR (100),
    PRIMARY KEY (dept_id)
);
 
 
CREATE TABLE comp3732_employees (
    emp_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    workRole VARCHAR (150),
    firstName VARCHAR (50),
    lastName VARCHAR (50),
    telephone VARCHAR (25),
    email VARCHAR (50),
    memberSince DATE,
	department SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (emp_id),
	FOREIGN KEY (department) REFERENCES comp3732_departments(dept_id)
		ON UPDATE CASCADE ON DELETE CASCADE
            ) ;


INSERT INTO comp3732_departments (deptName, deptType)
VALUES  ('Management', 'Management'),
        ('Human Resources', 'Administration'), 
        ('Finance', 'Display Cards'),
        ('Development and Design', 'Design'),
        ('Development and Design', 'Development'),
        ('Sales', 'Sales and Marketing'),
        ('Marketing', 'Sales and Marketing'),
        ('Shipping', 'Stock');			
 
 
INSERT INTO comp3732_employees (workRole, firstName, lastName, telephone, email, memberSince, department)
 VALUES ('Manager', 'Alan', 'Shepard','5550000', 'alan@generico.com', '1996-01-01', '1'),
        ('HR Head', 'Buzz', 'Aldrin',  '5550001', 'buzz@generico.com', '1999-11-21', '2'),
        ('Accounts', 'Gene', 'Cernan',  '5550002', 'gene@generico.com', '2004-03-31', '3'),
        ('Designer', 'Jim', 'Lovell',  '5550003', 'jim@generico.com', '2005-08-21', '4'),
        ('Senior Developer', 'Neil', 'Armstrong',  '5550004', 'neiln@generico.com', '2006-11-30', '5'),
        ('Developer', 'Pete', 'Conrad',  '5550005', 'pete@generico.com', '2006-08-22', '5'),
        ('Junior Developer', 'Ed', 'White',  '5550006', 'ed@generico.com', '2012-06-01', '5'),
        ('Sales Manager', 'John', 'Young',  '5550007', 'john@generico.com', '2008-12-11', '6'),
        ('Advertising Manager', 'Roger', 'Chaffee', '5550008', 'rogern@generico.com', '2010-10-21', '7'),
        ('Storeman', 'Alan', 'Bean',  '5550009', 'alanb@generico.com', '2010-04-01', '8'),
		('Executive Visionary Officer', 'Elon', 'Musk', '5550010', 'elon@generico.com', '1970-01-01', '1');
