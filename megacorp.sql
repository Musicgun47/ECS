drop table if exists comp3732_dept_manager_mega;
drop table if exists comp3732_employees_mega;
drop table if exists comp3732_departments_mega;
drop table if exists comp3732_positions_mega;
drop table if exists comp3732_pay_grades_mega;


CREATE TABLE comp3732_pay_grades_mega (
	pay_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	contractType VARCHAR (100),
	salary SMALLINT,
	hourlyRate INT (100),
	PRIMARY KEY (pay_id)
);

CREATE TABLE comp3732_positions_mega (
	pos_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	positionName VARCHAR (50),
	payGrade SMALLINT UNSIGNED,
    PRIMARY KEY (pos_id),
	FOREIGN KEY (payGrade) REFERENCES comp3732_pay_grades_mega (pay_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE comp3732_departments_mega (
	dept_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	deptName VARCHAR(50),
	location VARCHAR (25),
    PRIMARY KEY (dept_id)
);

CREATE TABLE comp3732_employees_mega (
	emp_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	firstName VARCHAR (50),
	lastName VARCHAR (50),
	homePhone VARCHAR (25) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (25),
	address VARCHAR (50),
	dept_id SMALLINT UNSIGNED,
    role_id SMALLINT UNSIGNED,
	PRIMARY KEY (emp_id),
	FOREIGN KEY (dept_id) REFERENCES comp3732_departments_mega (dept_id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (role_id) REFERENCES comp3732_positions_mega (pos_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO comp3732_pay_grades_mega (contractType, salary, hourlyRate)
VALUES 
	('casual', NULL, 25),
	('casual', NULL, 30),
	('casual', NULL, 35),
	('casual', NULL, 40),
	('casual', NULL, 42),
	('casual', NULL, 45),
	('contract', 100, NULL),
	('contract', 110, NULL),
	('contract', 120, NULL),
	('contract', 125, NULL),
	('permanent', 175, NULL),
	('permanent', 200, NULL);
	
INSERT INTO comp3732_positions_mega (positionName, payGrade)
VALUES 
	('CEO', 12),
	('CTO', 11),
	('Senior Manager', 10),
	('Human Resource Manager', 9),
	('Sales Manager', 8),
	('Marketing Manager', 9),
	('Sales', 6),
	('IT Guy', 5),
	('Senior Memer', 7),
	('Memer', 3),
	('Apprentice Memer', 2),
	('Administrative', 4),
	('Stores', 1);
	
INSERT INTO comp3732_departments_mega (deptName)
VALUES 
	('Human Resources/Administration'),
	('Product Development'),
	('Sales'),
	('Marketing'),
	('Supply Chain'),
	('IT');

INSERT INTO comp3732_employees_mega (firstName, lastName, homePhone, phone, email, address, dept_id, role_id)
VALUES 
	('Jimi', 'Hendrix', '5551001', '0412340001', 'jimi@megacorp.com', '27 Experience Drive', '1', '4' ),
	('Eddie', 'Vedder', '5550002', '0412340002', 'eddie@megacorp.com', '15-A Pearl Road', '1', '10'),
	('Dave', 'Grohl', '5550003', '0412340003', 'dave@megacorp.com', '16 Foo Place', '1', '4'),
	('Amanda', 'Palmer', '5550004', '0412340004', 'amanda@megacorp.com', '18 Dresden Ave', '1', '12'),
	('Beth', 'Gibbons', '5550005', '0412340005', 'beth@megacorp.com', '199 Portishead Court', '6', '5'),
	('Billie', 'Holliday', '5550006', '0412340006', 'billie@megacorp.com', '16 Blues Drive', '3', '9'),
	('James', 'Maynard', '5550007', '0412340007', 'james@megacorp.com', '1 Tool Crescent', '2', '2'),
	('Brian', 'Eno', '5550008', '0412340008', 'brian@megacorp.com', '13 Ambient Avenue', '2', '2'),
	('David', 'Bridie', '5550009', '0412340009', 'davidb@megacorp.com', '12 Waving Road', '1', '4'),
	('David', 'Bowie', '5550010', '0412340010', 'david@megacorp.com', 'The Labyrinth', '2', '7'),
	('Eric', 'Clapton', '5550011', '0412340011', 'eric@megacorp.com', '13 Layla Lane', '2', '2'),
	('Bob', 'Marley', '5550012', '0412340012', 'bob@megacorp.com', '4/20 Wailers Street', '2', '2'),
	('Hans', 'Zimmer', '5550013', '0412340013', 'hans@megacorp.com', '1 Aurora Avenue', '4', '6'),
	('Henry', 'Rollins', '5550014', '0412340014', 'henry@megacorp.com', '10 Black Road', '4', '6'),
	('John', 'Frusciante', '5550015', '0412340015', 'john@megacorp.com', '7 Empyrean Highway', '2', '7'),
	('Jeff', 'Buckley', '55500016', '0412340016', 'jeff@megacorp.com', '1 Grace Lane','2' , '2'),
	('Lauryn', 'Hill', '5550017', '0412340017', 'lauren@megacorp.com', '15 Fugees Street', '2', '2'),
	('Kurt', 'Cobain', '5550018', '0412340018', 'kurt@megacorp.com', '1 Grunge Grove', '4', '6'),
	('Midge', 'Ure', '5550019', '0412340019', 'midge@megacorp.com', '17 Lizzy Lane','2', '2'),
	('Neneh', 'Cherry', '5550020', '0412340020', 'nene@megacorp.com', '7 Second Street', '6', '5'),
	('Jack', 'White', '5550021', '0412340021', 'jack@megacorp.com', '18 Racontuer Road', '2', '2'),
	('Nick', 'Cave', '5550022', '0412340022', 'nick@megacorp.com', '18 Ship Street', '3', '6'),
	('Corey', 'Taylor', '5550023', '0412340023', 'corey@megacorp.com', '5 Maggot Road', '2', '2'),
	('Jim', 'Morrison', '5550024', '0412340024', 'jim@megacorp.com', '27 Doors Road', '2', '2'),
	('John', 'Lennon', '5550025', '0412340025', 'john@megacorp.com', '1 Abbey Road', '5', '1'),
	('Winston', 'McCall', '5550026', '0412340026', 'winston@megacorp.com', '1 Parkway Drive', '2', '2'),
	('Janis', 'Joplin', '5550027', '0412340027', 'Janis@megacorp.com', '27 Mercedes Road', '5', '1'),
	('David', 'Gilmour', '5550028', '0412340028', 'davidg@megacorp.com', '1 Stratocaster Lane ', '5', '1'),
	('Serj', 'Tankian', '5550029', '0412340029', 'serjg@megacorp.com', '104 Chopsuey Street ', '6', '5'),
	('Layne', 'Staley', '5550030', '0412340030', 'serjg@megacorp.com', '104 Chopsuey Street ', '6', '5'),
	('Jimmy', 'Page', '5551000', '0412340000', 'jimmy@megacorp.com', '1 Zeppelin Lane', '1', '9' );
 