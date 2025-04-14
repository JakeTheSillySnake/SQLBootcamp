-- drop existing functions
drop function fnc_persons_male();
drop function fnc_persons_female();

create function fnc_persons(pgender varchar = 'female') returns setof person
as 
$$
	select * from person where gender = pgender;
$$
language sql;

select * from fnc_persons();
select * from fnc_persons(pgender := 'male');