do $$
declare
	var int := (select max(id) from person_order);
	var2 int := (select max(id) from person);
begin
insert into person_order
select id, person_id, (select id from menu where pizza_name = 'greek pizza'), '2022-02-25'
from generate_series(var+1,var+var2) as g(id)
join generate_series(1,var2) as g2(person_id) on id = person_id+var;
end $$