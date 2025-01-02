-- Problem 1:
select Invoices.InvoiceNum, InvoiceDate
	from Invoices, InvoiceLine, Item
		where InvoiceLine.ItemID = Item.ItemID and Invoices.InvoiceNum = InvoiceLine.InvoiceNum and Item.Location = 'C';

-- Problem 2:
select InvoiceLine.ItemID, Quantity, InvoiceLine.InvoiceNum, Invoices.InvoiceDate, Customer.CustID, CustFirstName, CustLastName, RepLastName
	from InvoiceLine, Invoices, Customer, SalesRep
		where Invoices.InvoiceNum = InvoiceLine.InvoiceNum and Invoices.CustId = Customer.CustID and Customer.RepID = SalesRep.RepID;

-- Problem 3:
select Invoices.CustId, Invoices.InvoiceNum, Invoices.InvoiceDate, InvoiceLine.Quantity * InvoiceLine.QuotedPrice as InvoiceTotal
	from Invoices, InvoiceLine
		where Invoices.InvoiceNum = InvoiceLine.InvoiceNum and (InvoiceLine.Quantity * InvoiceLine.QuotedPrice) > 250
			order by Invoices.InvoiceNum;

-- Problem 4: This one is incomplete.
select a.custID, a.custFirstName, a.custLastName, b.custID, b.custFirstName, b.custLastName, b.custCity
	from Customer a, Customer b
		where a.custCity = b.custCity and a.custID < b.custID
			order by a.custID;