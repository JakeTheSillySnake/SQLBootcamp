select sub2.name, 
	(case when sub1.count is not null then sub1.count else 0 end
	+ case when sub2.count is not null then sub2.count else 0 end) total_count
from
(select pizzeria.name, count(*)
	from pizzeria
	join menu on pizzeria.id = pizzeria_id
	join person_order on menu.id = menu_id
	group by pizzeria.name) sub1
full join
(select pizzeria.name, count(*)
	from pizzeria
	join person_visits on pizzeria.id = pizzeria_id
	group by pizzeria.name) sub2 on sub1.name = sub2.name
order by 2 desc, 1 asc
