create function fnc_person_visits_and_eats_on_date(pperson varchar = 'Dmitriy', pprice numeric = 500, pdate date = '2022-01-08')
returns table (pizzeria_name varchar)
as $$
begin
	return query
	select pz.name as pizzeria_name from
	person_visits pv
	join person p on person_id = p.id
	join menu m on pv.pizzeria_id = m.pizzeria_id
	join pizzeria pz on m.pizzeria_id = pz.id
	where p.name = pperson and price < pprice and visit_date = pdate
	group by pizzeria_name;
end;
$$ language plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800)
select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01')