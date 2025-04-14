select name
from person
left join person_order on person.id = person_id
left join menu on menu_id = menu.id 
where gender = 'male' and (address = 'Moscow' or address = 'Samara')
and (pizza_name = 'mushroom pizza' or pizza_name = 'pepperoni pizza')
order by name desc