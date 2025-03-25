
Create table Employees(
ID int,
Name varchar(50),
Position varchar(50),
Salary int,
Exprience int
);


Insert Into Employees (ID, Name, Position, Salary, Exprience)
Values
    (1, 'Mukhtor', 'ITE', 66000, 6),
    (2, 'Nicola', 'DEVOS', 55000, 7),
    (3, 'Albert', 'Manager', 60000, 10),
    (4, 'Sophia', 'HR', 40000, 4),
    (5, 'David', 'Software Engineer', 70000, 8),
    (6, 'Emily', 'Data Analyst', 50000, 6),
    (7, 'Daniel', 'DevOps Engineer', 75000, 9),
    (8, 'Olivia', 'Product Manager', 65000, 7),
    (9, 'James', 'Security Analyst', 48000, 5),
    (10, 'Isabella', 'System Administrator', 53000, 6);




-- Query-1
Select * From Employees
Where Salary >= 50000;

-- Query-2
Select *,
	Case 
		When Exprience > 5 Then Salary+5000
		Else Salary
	End As Update_Salary
From Employees;

























