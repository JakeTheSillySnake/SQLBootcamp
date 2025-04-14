select 
	address, 
	round(max(age) - min(age) / max(age)::numeric, 2) formula,
	round(avg(age), 2) average,
	round(max(age) - min(age) / max(age)::numeric, 2) > round(avg(age), 2) comparison
from person
group by address
order by 1