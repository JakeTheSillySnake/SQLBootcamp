-- start transaction in session #1
begin;

-- update rating in session #1
update pizzeria set rating = 5 where name = 'Pizza Hut';

-- check rating in session #1 and #2 (value should only be updated in session #1)
select * from pizzeria where name = 'Pizza Hut';

-- update all sessions
commit;

-- check rating in session #2 (value should be updated)
select * from pizzeria where name = 'Pizza Hut';