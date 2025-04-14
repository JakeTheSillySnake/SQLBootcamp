-- session #1, then #2 (serializable isolation level)
begin transaction isolation level serializable;
show transaction isolation level;

-- session #1
select * from pizzeria where name = 'Pizza Hut';
-- session #2
update pizzeria set rating = 3.0 where name = 'Pizza Hut';
commit;
-- session #1 (value was updated)
select * from pizzeria where name = 'Pizza Hut';
commit;
-- session #1, then #2
select * from pizzeria where name = 'Pizza Hut';