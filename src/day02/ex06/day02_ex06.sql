select pizza_name, pizzeria.name as pizzeria_name
from person
left join person_order on person.id = person_id
left join menu on menu_id = menu.id
left join pizzeria on pizzeria.id = pizzeria_id
where person.name = 'Anna' or person.name = 'Denis'
order by pizza_name, pizzeria_name