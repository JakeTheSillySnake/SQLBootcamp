with data as (
	select
		user_id,
		coalesce(u.name, 'not defined') as name, 
		coalesce(lastname, 'not defined') as lastname, 
		type, 
		money,
		coalesce(c.name, 'not defined') as currency_name,
		coalesce(first_value(rate_to_usd) over (partition by currency_id order by c.updated desc), 1) as last_rate_to_usd
	from public.user u
	full join balance b on u.id = user_id
	full join currency c on currency_id = c.id
)

select distinct 
	name, 
	lastname, 
	type,
	sum(money) over (partition by user_id) as volume,
	currency_name, 
	last_rate_to_usd,
	sum(money) over (partition by user_id) * last_rate_to_usd as total_volume_in_usd
from data
group by user_id, name, lastname, type, money, currency_name, last_rate_to_usd
order by 1 desc, 2, 3