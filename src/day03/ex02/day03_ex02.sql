select pizza_name, price, pizzeria.name as pizzeria_name from 
	(select menu.id as menu_id from menu
	except
	select menu_id from person_order)
join menu on menu_id = menu.id
join pizzeria on pizzeria_id = pizzeria.id
order by pizza_name, price