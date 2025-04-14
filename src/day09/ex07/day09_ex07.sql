create function func_minimum(variadic arr numeric[]) returns numeric
as $$
	select min(i) from unnest($1) i; -- expands array to set of rows
$$ language sql;

select func_minimum(variadic arr => array[10.0, -1.0, 5.0, 4.4])