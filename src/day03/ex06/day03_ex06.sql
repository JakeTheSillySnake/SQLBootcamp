with data as (
	select menu.id, pizza_name, price, pizzeria.name as pizzeria_name
	from menu
	join pizzeria on pizzeria_id = pizzeria.id
)

select A.pizza_name, A.pizzeria_name as pizzeria_name_1, 
		B.pizzeria_name as pizzeria_name_2, A.price 
from data A
join data B on A.price = B.price and A.pizza_name = B.pizza_name and A.id > B.id
order by pizza_name