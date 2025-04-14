-- delete old triggers
drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;
-- delete old functions
drop function fnc_trg_person_insert_audit();
drop function fnc_trg_person_update_audit();
drop function fnc_trg_person_delete_audit();
-- delete all rows in person_audit
truncate table person_audit;

create function fnc_trg_person_audit() returns trigger as $person_audit$
	begin
		if (tg_op = 'INSERT') then
			insert into person_audit select now(), 'I', new.*;
		elsif (tg_op = 'UPDATE') then
			insert into person_audit select now(), 'U', old.*;
		elsif (tg_op = 'DELETE') then
			insert into person_audit select now(), 'D', old.*;
		end if;
		return null; -- this is an after trigger, result ignored
	end;
$person_audit$ language plpgsql;

create trigger trg_person_audit
after insert or update or delete on person
	for each row execute function fnc_trg_person_audit();

insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');
update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
delete from person where id = 10;

-- check trigger result
-- select * from person_audit