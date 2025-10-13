-- selecting all columns
select * from Sales.Orders

-- selecting all columns but with condition
select * from Sales.Orders
where BillAddress is Null

-- format output 
select (firstName +' '+ LastName) as Name  from Sales.Customers
where Score>400

select * from sales.Employees

-- using Group by clause to find avg salary by Gender
select Gender , avg(salary) as avg_salary from Sales.Employees
group by Gender

select * from Sales.Products

-- tricy one , understanding what is included in having clause and what is not
select Category , avg(Price) as price from Sales.Products
where price >10 
group by Category
having avg(price) >20
order by price desc

-- impt Understanding

--1 colum name, table name, attribute value , is case insensitive here
--2 havign clause only include group by columns or aggregate functions
--3 in order by clause we can use alias , because it runs after select statement but in other place we can;t
--4 where clause can only include column names and attribute values not alias or aggregate functions
--5 order by clause runs at last
--6 group by clause runs after where clause and before having clause
--7 where clause runs before group by clause
