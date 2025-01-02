select ItemID, Description, OnHand*Price as OnHandValue
	from Item
		where OnHand > (select avg(OnHand) from Item);