create index idx_1 on pizzeria(rating);

set enable_seqscan = off;
explain analyze
select
	m.pizza_name as pizza_name,
	max(rating) over (partition by rating rows between unbounded preceding and unbounded following) as k
from menu m
	inner join pizzeria pz on m.pizzeria_id = pz.id
order by 1,2