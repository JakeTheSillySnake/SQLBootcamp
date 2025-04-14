comment on table person_discounts is 'This table lists personal discounts in pizzerias based on the number of orders.';
comment on column person_discounts.id is 'Row identificator, primary key.';
comment on column person_discounts.person_id is 'Person identificator.';
comment on column person_discounts.pizzeria_id is 'Pizzeria identificator.';
comment on column person_discounts.discount is 'Personal discount (0-100%) in a pizzeria.';