select pizzeria.name as pizzeria_name
from person
left join person_visits on person.id = person_id
left join pizzeria on pizzeria_id = pizzeria.id
right join menu on pizzeria.id = menu.pizzeria_id
where person.name = 'Dmitriy' and visit_date = '2022-01-08' and price < 800