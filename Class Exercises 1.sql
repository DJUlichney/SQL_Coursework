-- Problem 3:
select distinct i.invoicenum, i.invoicedate
	from invoices i, invoiceline il, customer c, item it
		where i.invoicenum = il.invoicenum and i.custid = c.custid and il.itemid = it.itemid
			and ((c.custfirstname = 'James' and c.custlastname = 'Gonzalez') or (it.description = 'Wild Bird Food (25 lb)'));

-- Problem 4:
select distinct i.invoicenum, i.invoicedate
	from invoices i, invoiceline il, customer c, item it
		where i.invoicenum = il.invoicenum and i.custid = c.custid and il.itemid = it.itemid
			and (c.custfirstname = 'James' and c.custlastname = 'Gonzalez') and (it.description = 'Wild Bird Food (25 lb)');

-- Problem 5:
select distinct i.invoicenum, i.invoicedate
	from invoices i, invoiceline il, customer c, item it
		where i.invoicenum = il.invoicenum and i.custid = c.custid and il.itemid = it.itemid
			and (c.custfirstname = 'James' and c.custlastname = 'Gonzalez') and (it.description != 'Wild Bird Food (25 lb)');

-- Problem 6:
select itemid, description, price, category
	from item
		where price > all (select price
								from item
									where category = 'CAT');

select itemid, description, price, category
	from item
		where price > (select max(price)
								from item
									where category = 'CAT');

-- Problem 7:
select itemid, description, price, category
	from item
		where price > any (select price
								from item
									where category = 'CAT');
