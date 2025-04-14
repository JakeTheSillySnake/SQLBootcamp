select address, pizzeria.name, count(*)
from person_order
join menu on menu_id = menu.id
join pizzeria on pizzeria_id = pizzeria.id
join person on person_id = person.id
group by address, pizzeria.name
order by 1, 2