select 
	name, 
	count(*) as count_of_orders, 
	round(avg(price), 2) as average_price, 
	max(price) as max_price, 
	min(price) as min_price
from person_order
join menu on menu_id = menu.id
join pizzeria on pizzeria_id = pizzeria.id
group by name
order by 1
