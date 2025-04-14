with data as (
	select pizzeria.name as pizzeria_name, gender
	from person
	join person_order on person.id = person_id
	join menu on menu_id = menu.id
	join pizzeria on pizzeria_id = pizzeria.id
)

(select pizzeria_name from data where gender = 'female'
except
select pizzeria_name from data where gender = 'male')
union
(select pizzeria_name from data where gender = 'male'
except
select pizzeria_name from data where gender = 'female')
order by pizzeria_name