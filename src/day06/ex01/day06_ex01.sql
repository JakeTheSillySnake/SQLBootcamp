insert into person_discounts
select 
	row_number() over() as id, 
	person_id, 
	pizzeria_id, 
	case 
		when count_order = 1 then 10.5
		when count_order = 2 then 22
		else 30
	end
	discount
from (
	select person_id, pizzeria_id, count(pizzeria_id) as count_order
	from person_order
	join menu on menu_id = menu.id
	group by person_id, pizzeria_id
	order by 1
);