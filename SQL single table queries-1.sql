select *
	from Invoices;

select CustFirstName, CustLastName
	from Customer
		where CustCreditLimit >= 1000;

select InvoiceNum
	from Invoices
		where CustID = '125' and InvoiceDate = '11/15/2021';

select CustID, CustFirstName, CustLastName
	from Customer
		where RepID = '10' or RepID = '15';

select ItemID, Description
	from Item
		where Category != 'HOR';

select ItemID, Description, OnHand
	from Item
		where OnHand between '10' and '30';

select ItemID, Description, OnHand
	from Item
		where OnHand >= '10' and OnHand <= '30';

select ItemID, Description, OnHand*Price as OnHandValue
	from Item
		where Category = 'CAT';