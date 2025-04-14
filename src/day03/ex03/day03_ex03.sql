with data as (
	select pizzeria.name as pizzeria_name, gender
	from person
	join person_visits on person.id = person_id
	join pizzeria on pizzeria_id = pizzeria.id
)

(select pizzeria_name from data where gender = 'female'
except all
select pizzeria_name from data where gender = 'male')
union all
(select pizzeria_name from data where gender = 'male'
except all
select pizzeria_name from data where gender = 'female')
order by pizzeria_name