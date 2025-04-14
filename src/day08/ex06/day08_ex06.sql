-- session #1, then #2 (repeatable read)
begin transaction isolation level repeatable read;
show transaction isolation level;
-- session #1
select sum(rating) from pizzeria;
-- session #2
insert into pizzeria values(11, 'Kazan Pizza 2', 4);
commit;
-- session #1 (value was updated)
select sum(rating) from pizzeria;
commit;
-- session #1, then #2
select sum(rating) from pizzeria;