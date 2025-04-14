select coalesce(person.name, '-') as person_name, coalesce(visit_date, null) as visit_date, 
	coalesce(pizzeria.name, '-') as pizzeria_name
from person
full join person_visits on person.id = person_id and visit_date between '2022-01-01' and '2022-01-03'
full join pizzeria on pizzeria.id = pizzeria_id and visit_date between '2022-01-01' and '2022-01-03'
where pizzeria.name is not null or person.name is not null
order by person_name, visit_date, pizzeria_name