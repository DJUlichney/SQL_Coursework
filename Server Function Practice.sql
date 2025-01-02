-- Problem 1:
select itemid, upper(description)
	from item;

-- Problem 2:
select custid, custfirstname, custlastname, round(custbalance, 0) as custbalance
	from customer;

-- Problem 3:
select custid, concat (custfirstname, ' ', custlastname) as custname
	from customer;

-- Problem 4:
select concat(datepart(year, getdate()), '-', datepart(month, getdate()), '-', datepart(day, getdate())) as date;

-- Problem 5:
select invoicenum, dateadd(month, 1, invoicedate) as nextmonth
	from invoices;

-- Problem 6:
select invoicenum, dateadd(day, 7, invoicedate) as nextweek
	from invoices;

-- Problem 7:
select invoicenum, concat(datepart(year, getdate()), '-', datepart(month, getdate()), '-', datepart(day, getdate())) as todaysdate, invoicedate, datediff(day, getdate(), invoicedate) as dayspast
	from invoices;