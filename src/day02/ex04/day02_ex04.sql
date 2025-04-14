select pizza_name, pizzeria.name as pizzeria_name, price
from menu
full join pizzeria on pizzeria_id = pizzeria.id
where pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza'
order by pizza_name, pizzeria_name