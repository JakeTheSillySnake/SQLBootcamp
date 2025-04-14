create or replace function fnc_fibonacci(pstop int = 10) returns table (numbers bigint)
as $$
	with recursive fib(a, b) as (
		select 0 as a, 1 as b
		union all
		select b as a, a + b as b
		from fib
		where b < pstop
	)
	select a as numbers from fib;
$$ language sql;

select * from fnc_fibonacci(100)
select * from fnc_fibonacci()