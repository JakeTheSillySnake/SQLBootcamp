select pizza_name, price, pizzeria.name as pizzeria_name, visit_date
from person_visits
join person on person_id = person.id and person.name = 'Kate'
join pizzeria on pizzeria_id = pizzeria.id
join menu on pizzeria.id = menu.pizzeria_id and price between 800 and 1000
order by pizza_name, price, pizzeria_name