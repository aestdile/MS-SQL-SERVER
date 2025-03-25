
/*
-- Inner Join -> Ikkala jadvaldagi bir-biriga bog'liq bo'lgan ma'lumotlarni chiqaradi
Select orders.OrderID, orders.OrderDate, customers.CompanyName
From Orders As orders
Inner Join Customers As customers
On orders.CustomerID = customers.CustomerID
Order By OrderID;
*/

/*
-- Left Join -> birinchi jadvaldagi to'liq va ikkala jadvalda mavjud bo'lgan ma'lumotlarni chiqaradi
Select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Customers.Country
From Orders
Left Join Customers
On Orders.CustomerID = Customers.CustomerID
Order By OrderID;
*/

/*
-- Right Join -> ikkinchi jadvaldagi to'liq va ikkala jadvalda mavjud bo'lgan ma'lumotlarni chiqaradi
Select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Customers.Country
From Orders
Right Join Customers
On Orders.CustomerID = Customers.CustomerID
Order By OrderID;
*/

/*
-- Full Join -> Ikkala jadvaldagi barcha ma'lumotlarni chiqaradi
Select Orders.OrderID, Orders.OrderDate, Customers.CompanyName, Customers.Country
From Orders
Full Join Customers
On Orders.CustomerID = Customers.CustomerID
Order By OrderID;
*/



