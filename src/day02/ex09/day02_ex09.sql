with Names as (
	select name, pizza_name from person
	left join person_order on person.id = person_id
	left join menu on menu_id = menu.id
	where gender = 'female'
)

select name from Names where pizza_name = 'cheese pizza'
intersect
select name from Names where pizza_name = 'pepperoni pizza'
order by name