insert into person_visits values ((select max(id)+1 from person_visits), (select id from person where name = 'Dmitriy'),
			(select pizzeria.id from pizzeria join menu on pizzeria.id = menu.pizzeria_id and price < 800 where pizzeria.name != 'Papa Johns' limit 1), 
			'2022-01-08');
			
refresh materialized view mv_dmitriy_visits_and_eats;