/*UseCase1*/
use PayrollService

/*UseCase2*/
Create Table employee_payroll(
	id int identity(1,1) PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	salary DECIMAL(10,2) NOT NULL,
	start_Date DATETIME NOT NULL ) ;

/*UseCase3*/
Insert Into employee_payroll
	Values('Sunny',199,'2020-10-30');

/*UseCase4*/
Select * From employee_payroll;

--UseCase5
--Ability to retrieve salary data
Select salary from employee_payroll
	where lower(name) = 'Sunny'
Select salary from employee_payroll
	where start_Date between CAST('2020-10-30' As DATE) and GETDATE();

--UseCase6
--Ability to add gender
Alter table employee_payroll
	add gender varchar(10) NOT NULL DEFAULT(' ');
Update employee_payroll set gender = 'M'
	where lower(name) ='sunny';

select * from employee_payroll;

--usecase7
select sum(salary) from employee_payroll
	where gender='M' group by gender;

--Deleting duplicate records
DELETE TOP(2)
	FROM employee_payroll;

--View data after deleting duplicates
SELECT * FROM employee_payroll;

--Delete all data from the table
DELETE FROM employee_payroll;

SELECT * FROM employee_payroll;

--Inserting data
Insert Into employee_payroll
	Values('Sunny',199,'2020-10-30','M'),('Carry',899,'2020-09-30','M'),('Mishi',1799,'2014-08-08','F');

--View the table
SELECT * FROM employee_payroll;

UPDATE employee_payroll
	SET id=1 WHERE name='Sunny';

SELECT SUM(salary) AS TOTAL_SUM, AVG(salary) AS AVERAGE, MIN(salary) AS MINIMUM_SALARY FROM employee_payroll
	WHERE gender='M' GROUP BY gender;

SELECT COUNT(gender) AS GENDER FROM employee_payroll WHERE gender='M' GROUP BY gender;

SELECT @@version;

exec sp_help "employee_payroll";
