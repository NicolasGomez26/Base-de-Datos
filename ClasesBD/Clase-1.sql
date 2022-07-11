SET SQL_MODE = 'ONLY_FULL_GROUP_BY';
--  CONSIGNA 1
-- Where
-- 1. Mostrar el nombre, precio y color de los accesorios para asientos de las bicicletas
-- cuyo precio sea mayor a 100 pesos
-- Tablas: Production.Product
-- Campos: Name, ListPrice, Color
select Name, ListPrice, Color
from product
where ListPrice > 100;

-- Operadores & joins
-- 1. Mostrar los empleados que tienen más de 90 horas de vacaciones
-- Tablas: Employee
-- Campos: VacationHours, BusinessEntityID
select VacationHours, BusinessEntityID
from Employee
where VacationHours > 90;

-- 2. Mostrar el nombre, precio y precio con iva de los productos con precio distinto de
-- cero
-- Tablas: Product
-- Campos: Name, ListPrice
select Name, ListPrice
from Product
where ListPrice != 0;
-- 3. Mostrar precio y nombre de los productos 776, 777, 778
-- Tablas: Product
-- Campos: ProductID, Name, ListPrice

select ProductID, Name, ListPrice
from Product
where ProductID = 776 OR ProductID = 777 OR ProductID = 778;

-- Order by
-- 1. Mostrar las personas ordenadas primero por su apellido y luego por su nombre
-- Tablas: Contact
-- Campos: Firstname, Lastname
-- Funciones de agregación
SELECT Firstname, Lastname
FROM person
order by Firstname ASC;
SELECT Firstname, Lastname
FROM person
order by Lastname ASC;

-- 1. Mostrar la cantidad y el total vendido por productos
-- Tablas: SalesOrderDetail
-- Campos: LineTotal
select LineTotal, ProductID
from salesorderdetail;

-- Group by
-- 1. Mostrar el código de subcategoría y el precio del producto más barato de cada una
-- de ellas
-- Tablas: Product
-- Campos: ProductSubcategoryID, ListPrice
select ProductSubcategoryID, ListPrice
from Product
where ProductSubcategoryID != 0
order by ListPrice ASC;

-- Having

-- 1. Mostrar todas las facturas realizadas y el total facturado de cada una de ellas
-- ordenado por número de factura pero sólo de aquellas órdenes superen un total de
-- $10.000
-- Tablas: SalesOrderDetail
-- Campos: SalesOrderID, LineTotal
select SalesOrderID, LineTotal
from SalesOrderDetail
HAVING LineTotal > 10000
order by SalesOrderID;

-- Joins

-- 1. Mostrar los empleados que también son vendedores
-- Tablas: Employee, SalesPerson
-- Campos: BusinessEntityID
select employee.businessentityID, employee.loginID
from Employee
join SalesPerson on Employee.businessentityID = SalesPerson.BusinessEntityID;

-- 2. Mostrar los empleados ordenados alfabéticamente por apellido y por nombre
-- Tablas: Employee, Contact
-- Campos: BusinessEntityID, LastName, FirstName
select  person.LastName, person.FirstName
from employee join person
on employee.BusinessEntityID = person.BusinessEntityID
order by LastName, FirstName;

-- -------------------------------------------------- ----------------------------------------------------------------- ---
-- CONSIGNA 2
-- Where
-- 1. Mostrar los nombre de los productos que tengan cualquier combinación de
-- ‘mountain bike’
-- Tablas: Product
-- Campos: Name

select Name
from product 
where Name like '%mountain bike%';


-- 2. Mostrar las personas cuyo nombre empiece con la letra “y”
-- Tablas: Contact
-- Campos: FirstName
select firstName
from person
where FirstName like "y%";

-- Order by
-- 1. Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
-- Tablas: Product
-- Campos: Name, ListPrice
select name, listPrice
from product
order by ListPrice desc limit 5;

-- Operadores & joins
-- 1. Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea johnson
-- Tablas: Contact
-- Campos: FirstName, LastName
select concat("Nombre: ", FirstName, " ", LastName)
from person
where LastName = "johnson";

-- 2. Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo precio sea mayor a 500$ de color negro
-- Tablas: Product
-- Campos: ListPrice, Color
select name, listPrice, color
from product
where (ListPrice < 150 and color = "red") or (ListPrice > 500 and color = "black");

-- Funciones de agregación
-- 1. Mostrar la fecha más reciente de venta
-- Tablas: SalesOrderHeader
-- Campos: OrderDate
select max(orderDate)
from salesOrderHeader;

-- 2. Mostrar el precio más barato de todas las bicicletas
-- Tablas: Product
-- Campos: ListPrice, Name
select min(listPrice), name
from product
where ListPrice != 0;

-- Group by
-- 1. Mostrar los productos y la cantidad total vendida de cada uno de ellos
-- Tablas: SalesOrderDetail
-- Campos: ProductID, OrderQty
select productID, count(orderQty)
from salesorderdetail
group by ProductID;

-- Having
-- 1. Mostrar la cantidad de facturas que vendieron más de 20 unidades.
-- Tablas: Sales.SalesOrderDetail
-- Campos: SalesOrderID, OrderQty
select salesOrderID, OrderQty
from salesorderdetail
group by SalesOrderID, OrderQty
having OrderQty > 20;

-- Joins
-- 1. Mostrar el código de logueo, número de territorio y sueldo básico de los
-- vendedores
-- Tablas: Employee, SalesPerson
-- Campos: LoginID, TerritoryID, Bonus, BusinessEntityID
select em.LoginID,sp.territoryID, sp.bonus
from employee em join salesperson sp
on em.BusinessEntityID = sp.BusinessEntityID;


-- 2. Mostrar los productos que sean ruedas
-- Tablas: Product, ProductSubcategory
-- Campos: Name, ProductSubcategoryID
select p.name
from product p join productsubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.name like "%wheels%";

-- 3. Mostrar los nombres de los productos que no son bicicletas
-- Tablas: Product, ProductSubcategory
-- Campos: Name, ProductSubcategoryID
select p.name
from product p join productsubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.name like "%bike%";
