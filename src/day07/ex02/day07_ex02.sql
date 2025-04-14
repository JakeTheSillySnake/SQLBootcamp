(select pizzeria.name, count(*), 'order' as action_type
	from pizzeria
	join menu on pizzeria.id = pizzeria_id
	join person_order on menu.id = menu_id
	group by pizzeria.name
	order by 2 desc
	limit 3)
union
(select pizzeria.name, count(*), 'visit' as action_type
	from pizzeria
	join person_visits on pizzeria.id = pizzeria_id
	group by pizzeria.name
	order by 2 desc
	limit 3)
order by 3, 2 desc

	