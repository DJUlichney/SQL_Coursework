-- Problem 1:
select owner_num, owner_last_name, owner_first_name
	from owner;

-- Problem 2:
select *
	from property;

-- Problem 3:
select owner_first_name, owner_last_name
	from owner
		where owner_city = 'Seattle';

-- Problem 4:
select owner_first_name, owner_last_name
	from owner
		where owner_city != 'Seattle';

-- Problem 5:
select property_id, property_office_num
	from property
		where property_square_ft <= 1400;

-- Problem 6:
select property_office_num, property_address
	from property
		where property_bedrooms = 3;

-- Problem 7:
select property_id
	from property, office
		where (property_office_num = office_num) and (Property_bedrooms = 2) and (office_name = 'StayWell-Georgetown');

-- Problem 8:
select property_id
	from property
		where property_monthly_rent between 1350 and 1750;

-- Problem 9:
select property_id
	from property, office
		where (property_office_num = office_num) and (property_monthly_rent < 1500) and (office_name = 'StayWell-Colombia City');

-- Problem 10:
select property_id, category_number, service_est_hours, service_est_hours*35 as EstimatedCost
	from service_request;

-- Problem 11:
select owner_num, owner_last_name
	from owner
		where (owner_state = 'NV') or (owner_state = 'OR') or (owner_state = 'ID');

select owner_num, owner_last_name
	from owner
		where owner_state in ('NV', 'OR', 'ID');

-- Problem 12:
select property_office_num, property_id, property_square_ft, property_monthly_rent
	from property
		order by property_square_ft, property_monthly_rent;

-- Problem 13:
select property_office_num, count(property_id) as three_bedroom_properties
	from property, office
		where (property_office_num = office_num) and (property_bedrooms = 3)
			group by property_office_num;

-- Problem 14:
select sum(property_monthly_rent) as total_monthly_rent
	from property;

-- Problem 15:
select *
	from service_request
		where charindex('heating', service_description) != 0;