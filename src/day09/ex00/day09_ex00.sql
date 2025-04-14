create table person_audit
( created timestamp with time zone not null default current_timestamp,
  type_event char(1) not null default 'I',
  row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar,
  constraint ch_type_event check (type_event in ('I', 'U', 'D'))
);

create function fnc_trg_person_insert_audit() returns trigger as $person_audit$
	begin
		if (tg_op = 'INSERT') then
			insert into person_audit select now(), 'I', new.*;
		end if;
		return null; -- this is an after trigger, result ignored
	end;
$person_audit$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person
	for each row execute function fnc_trg_person_insert_audit();

insert into person values (10, 'Damir', 22, 'male', 'Irkutsk');

-- check trigger result
-- select * from person_audit;