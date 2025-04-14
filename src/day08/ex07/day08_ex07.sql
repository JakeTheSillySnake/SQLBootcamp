-- session #1, then #2 (read committed)
begin;
show transaction isolation level;
-- session #1
update pizzeria set rating = 1 where id = 1;
-- session #2
update pizzeria set rating = 1 where id = 2;
-- session #1
update pizzeria set rating = 2 where id = 2;
-- session #2
update pizzeria set rating = 2 where id = 1;
-- session #1
commit;
-- session #2
commit;
-- session #1, then #2
select * from pizzeria;