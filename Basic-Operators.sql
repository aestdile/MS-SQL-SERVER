

-- 1. '*' -> belgisi tabledagi barcha ma'lumotlarni chiqishini ta'minlaydi 

Select * From Customers;

-- 2. Top 3 -> dastlabki 3 ta ma'lumotni chiqaradi, n - ixtiyoriy qiymat

Select top 3 * From Orders;

-- 3. As -> ustun nomlarini o'zgartirish uchun

Select CompanyName As KompaniyaNomi, Country As 'Davlat', City As [Shahar], Region Mintaqa From Customers;

-- 4. Concat -> bir neacht austunlardagi ma'lumotlarni qo'shib, bitta ustunda chiqarish

Select Concat (FirstName, ' ', LastName) As FullName From Employees;

-- 5. Where -> odatda shart berish uchun ishlatiladi.

Select ContactName, Phone From Customers Where Country = 'UK';

-- 6. Like -> Where comandasiga o'xshash va qo'shimcha shart yuklash uchun ishlatiladi

Select * From Products Where ProductName Like '%Coffee%'; 

-- 7. And, Or -> Shartlarni uyg'unlashtiradi

Select * From Orders 
	Where Freight >= 25 And Freight <=30;


-- Suppliers jadvalidan Country'lari USA bo'lgan yoki CompanyName'lari 'N' harfi bilan boshlangan ustunlarning
--	CompanyName, ContactName, Country kabi ma'lumotlarini chiqarish

Select CompanyName, ContactName, Country From Suppliers
	Where Country = 'USA' Or CompanyName Like 'N%';

Select CompanyName, ContactName, Country From Customers 
	Where (Country = 'UK' And City Like 'London') 
		Or Country Like 'Germany';

-- 8. Order By ASC, DESC -> shart bo'yicha ma'lumotlarni o'sish yoki kamayish tartibida chiqarish

Select Title, FirstName, LastName From Employees
	Order By FirstName ASC;

Select EmployeeID, Title, FirstName, LastName From Employees
	Order By EmployeeID DESC;

-- 9. Distinct - berilgan ustundagi qiymatlarni faqat bir marta chiqishini ta'minlaydi

Select Distinct Country From Customers;

-- 10. Count -> umumiy qiymatni ifodalaydi

Select Count(*) As [Umumiy mahsulotlar soni] From Products;

-- 11. Sum -> Jami miqdor

Select Sum(Quantity) From [Order Details];

-- 12. AVG -> o'rtacha qiymat

Select AVG(UnitPrice) From Products;

-- 13. Case -> C# dagidek tanlash operatori vazifasini bajaradi.

Select OrderID As Buyurtma, Quantity As [Miqdor Soni],
	Case
		When Quantity > 10 Then 'Miqdori 10 dan katta'
		When Quantity < 10 Then 'Miqdori 10 dan kam'
		Else 'Miqdori 10 ta'
	End As 'Miqdori qancha'
From [Order Details];


--  Row_Count comandasi

with RankedOrders as
(
	select 
		OrderID as 'Buyurtma Raqami', 
		Quantity as 'Miqdor Soni', 
		case 
			when Quantity > 10 then 'Miqdori 10 dan katta'
			when Quantity < 10 then 'Miqdori 10 dan kam'
			else 'Miqdori 10 ta'
		end as 'Miqdori qancha',
		row_number() over (partition by
		case 
			when Quantity > 10 then 'Miqdori 10 dan katta'
			when Quantity < 10 then 'Miqdori 10 dan kam'
			else 'Miqdori 10 ta'
		end
		order by Quantity asc, OrderID) as Rownum
	from [Order Details]
	where Quantity between 9 and 11
)
select 
	[Buyurtma raqami],
	[Miqdor soni],
	[Miqdori qancha]
from RankedOrders
where Rownum <=2
order by [Miqdor soni], [Buyurtma raqami];


-- 14. Group By, Having

Select ShipCountry, Count(*) as ShipCount From Orders Group By(ShipCountry);


-- Customer jadvalidan Country ustunidagi ma'lumotlarni CustomerID bo'yicha kamayish tartibida

Select Country, Count(CustomerID) As CustomerCount From Customers 
	Group By Country
	Order By Count(CustomerID) DESC;

Select CategoryID, Count(ProductID) ProdCount From Products
	Group By CategoryID
	Having Count(ProductID) >=10;


















