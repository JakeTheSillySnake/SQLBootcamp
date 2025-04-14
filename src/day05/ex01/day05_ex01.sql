set enable_seqscan = off;
explain analyze
select pizza_name, pizzeria.name as pizzeria_name
from menu 
join pizzeria on pizzeria_id = pizzeria.id