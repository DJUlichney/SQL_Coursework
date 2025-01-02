-- Problem 1:
select c.custID, custFirstName, custLastName, InvoiceDate
	from Customer c, Invoices i
		where c.custID = i.custID and InvoiceDate != '2021-11-15';

-- Problem 2:
select c.custID, c.custFirstName, c.custLastName, il.ItemID
	from Customer c, InvoiceLine il, Invoices i, Item it
		where c.custID = i.custID and i.InvoiceNum = il.invoiceNum and il.itemID = it.itemID and it.Description = 'Wild Bird Food (25 lb)';

-- Problem 3:
select i.invoiceNum, i.invoiceDate
	from Invoices i, Customer c
		where i.custID = c.custID and custFirstName = 'James' and custLastName = 'Gonzalez';

select invoiceNum, InvoiceDate
	from invoices
		where custID in (select custID
							from Customer
								where custFirstName = 'James' and custLastName = 'Gonzalez');

-- Problem 4:
select i.invoiceNum, i.invoiceDate
	from Invoices i, Customer c, InvoiceLine il, Item it
		where i.custID = c.custID and i.invoiceNum = il.invoiceNum and il.itemID = it.itemID and Description = 'Wild Bird Food (25 lb)' and custFirstName = 'James' and custLastName = 'Gonzalez';

-- Problem 5:
select a.itemID, a.description, b.itemID, b.description, a.category
	from Item a, Item b
		where a.category = b.category and a.itemID != b.itemID and a.itemid < b.itemid;