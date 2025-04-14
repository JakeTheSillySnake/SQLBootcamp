-- session #1, then #2 (read committed)
begin;
show transaction isolation level;
-- session #1
select sum(rating) from pizzeria;
-- session #2
insert into pizzeria values(10, 'Kazan Pizza', 5);
commit;
-- session #1 (value was updated)
select sum(rating) from pizzeria;
commit;
-- session #1, then #2
select sum(rating) from pizzeria;