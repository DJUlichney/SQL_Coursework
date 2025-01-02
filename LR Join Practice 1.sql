-- Problem 1:
select invoicenum, invoicedate
	from invoices
		where invoicenum in (select invoicenum
								from invoiceline
									where itemid = 'KH81');

-- Problem 2:
select description
	from item
		where itemid in (select itemid
							from invoiceline
								where invoicenum = '14233');

-- Problem 3:
select invoicenum, invoicedate
	from invoices
		where invoicenum in (select invoicenum
								from invoiceline
									where itemid in (select itemid
														from item
															where location = 'C'));

-- Problem 4:
select i.itemid, i.description, i.onhand, il.invoicenum, il.quantity
	from item i
		left join invoiceline il on i.itemid = il.itemid
			order by i.itemid;
			
-- Problem 5:
select custid, custfirstname, custlastname, repfirstname, replastname
	from customer c
		right join salesrep r on c.repid = r.repid
			order by r.repid;