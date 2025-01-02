-- Problem 1:
create table NonCat (
	ItemNum char(4) primary key,
	Description char(30),
	OnHand decimal(4,0),
	Category char(3),
	Price decimal(6,2)
	)

-- Problem 2:
insert into noncat
	select itemid, description, onhand, category, price
		from item
			where category != 'CAT';

-- Problem 3:
update noncat
	set description = 'Dog Toy Gift Bonzana'
		where itemnum = 'DT12';

-- Problem 4:
update noncat
	set price = price * 1.05
		where category = 'BRD';

-- Problem 5:
insert into noncat
	values('FF17', 'Premium Fish Food', 10, 'FSH', 11.95);

-- Problem 6:
delete from noncat
	where category = 'HOR';

-- Problem 7:
update noncat
	set category = null
		where itemnum = 'UF39';

-- Problem 8:
alter table noncat
	add OnHandValue decimal(7,2);

update noncat
	set onhandvalue = onhand * price;

-- Problem 9:
alter table noncat
	alter column description char(40);

-- Problem 10:
drop table noncat;