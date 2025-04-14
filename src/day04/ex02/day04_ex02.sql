create view v_generated_dates as
select generated_date::date 
from generate_series('2022-01-01', '2022-01-31', '1 day'::interval) as g(generated_date)
order by 1