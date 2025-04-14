-- session #1, then #2 (read committed)
begin;
show transaction isolation level;

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- session #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;
-- session #1 (value was updated)
select * from pizzeria where name = 'Pizza Hut';
commit;
-- session #1, then #2
select * from pizzeria where name = 'Pizza Hut';