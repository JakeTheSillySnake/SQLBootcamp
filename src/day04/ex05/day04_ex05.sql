create view v_price_with_discount as
select name, pizza_name, price, round(price * 0.9) as discount_price
from person
join person_order on person.id = person_id
join menu on menu_id = menu.id
order by 1, 2
