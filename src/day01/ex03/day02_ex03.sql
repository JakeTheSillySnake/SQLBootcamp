with Day_Generator as (
	select missing_date::date
	from generate_series('2022-01-01'::timestamp, '2022-01-10'::timestamp, '1 day'::interval) missing_date
)

select missing_date from Day_Generator
left join person_visits on missing_date = visit_date and person_id between 1 and 2
where person_id is null
order by missing_date