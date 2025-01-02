-- Problem 1:
select property_office_num, property_address, property_monthly_rent, property_owner_num, owner_first_name, owner_last_name
	from property, owner
		where property_owner_num = owner_num;

-- Problem 2:
select property_id, service_description, service_status
	from service_request;

-- Problem 3:
select sr.property_id, office_id, property_address, service_est_hours, service_spent_hours, property_owner_num, owner_last_name
	from service_request sr, property p, owner, service_category sc
		where sr.property_id = p.property_id and property_owner_num = owner_num and sr.category_number = sc.category_num and category_description = 'Furniture replacement';

-- Problem 4:
select owner_first_name, owner_last_name
	from owner
		where owner_num in (select property_owner_num
								from property
									where property_bedrooms = 2);

-- Problem 5:
select p1.property_id, p2.property_id
	from property p1, property p2
		where p1.property_bedrooms = p2.property_bedrooms and p1.property_id < p2.property_id;

-- Problem 6:
select property_square_ft, property_owner_num, owner_last_name, owner_first_name
	from property, owner, office
		where property_owner_num = owner_num and property_office_num = office_num and office_area = 'Colombia City';

-- Problem 7:
select property_square_ft, property_owner_num, owner_last_name, owner_first_name
	from property, owner, office
		where property_owner_num = owner_num and property_office_num = office_num and office_area = 'Colombia City' and property_bedrooms = 3;

-- Problem 8:
select property_office_num, property_address, property_monthly_rent
	from property, owner
		where property_owner_num = owner_num and (owner_state = 'WA' or property_bedrooms = 2);

-- Problem 9:
select property_office_num, property_address, property_monthly_rent
	from property, owner
		where property_owner_num = owner_num and owner_state = 'WA' and property_bedrooms = 2;

-- Problem 10:
select property_office_num, property_address, property_monthly_rent
	from property, owner
		where property_owner_num = owner_num and owner_state = 'WA' and property_bedrooms != 2;

-- Problem 11:
select service_id, sr.property_id
	from service_request sr, property p
		where sr.property_id = p.property_id and service_est_hours > any(select service_est_hours
																			from service_request
																				where category_number = 5);

-- problem 12:
select service_id, sr.property_id
	from service_request sr, property p
		where sr.property_id = p.property_id and service_est_hours > all(select service_est_hours
																			from service_request
																				where category_number = 5);

-- Problem 13:
select property_address, property_square_ft, property_owner_num, service_id, service_est_hours, service_spent_hours
	from property p, service_request sr
		where p.property_id = sr.property_id and category_number = 4;

-- Problem 14:
select property_address, property_square_ft, property_owner_num, service_id, service_est_hours, service_spent_hours
	from property p
	left join service_request sr on p.property_id = sr.property_id and category_number = 4;

-- Problem 15:
select property_address, property_square_ft, property_owner_num, service_id, service_est_hours, service_spent_hours
	from service_request sr
	right join property p on sr.property_id = p.property_id and category_number = 4;

-- This command is different from the original because it uses a right join and swaps the order of the two tables.
-- This difference, however, does not produce different results because it is functionally the same and the columns
-- returned have the same order as the original.