(select pizzeria.name from pizzeria
join person_visits on pizzeria.id = pizzeria_id
join person on person_id = person.id and person.name = 'Andrey')
except
(select pizzeria.name from pizzeria
join menu on pizzeria.id = pizzeria_id
join person_order on menu.id = menu_id
join person on person_id = person.id and person.name = 'Andrey')
