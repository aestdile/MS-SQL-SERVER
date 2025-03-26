-- Ichki so'rovlar
-- In, Not In, Between, Exists

Select ProductName From Products
Where CategoryID = (Select CategoryID From Categories Where CategoryName Like 'Beverages');

Select TerritoryDescription From Territories
Where RegionID = (Select RegionID From Region Where RegionDescription = 'Northern');

Select CompanyName From Customers 
Where CustomerID In (Select CustomerID From Orders Where OrderDate Between '1998-05-06' And '1998-05-07');

 Select CompanyName, Country From Suppliers
 Where Country In ('Japan', 'Canada');

 Select FirstName, LastName From Employees
 Where EmployeeID NOT In (Select EmployeeID From EmployeeTerritories);

 Select CustomerID, CompanyName, Country From Customers
 Where Country Not In ('France', 'USA');

 -- Exists -> 1 ta bo'lsa ham buyurtma bergan mijozlarni olish
 Select CustomerID, CompanyName From Customers As c 
 Where Exists (Select OrderID From Orders As o Where c.CustomerID = c.CustomerID);

 -- 20 tadan ko'p buyurtma bergan mijozlarni olish
 Select c.CompanyName From Customers As c 
 Where 
	Exists (
		Select Count(*) From Orders As o
		Where CustomerID = c.CustomerID
		Group By CustomerID
		Having Count(*) > 20)
Order By CompanyName;

Select c.CompanyName, Count(*) OrdersCount From Customers As c
Join Orders As o
On c.CustomerID = o.CustomerID
Group By c.CompanyName
Having Count(*) > 20;

-- Exists dan ko'ra Join ni ishlatish afzalroq ekan



