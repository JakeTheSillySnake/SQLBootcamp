select p.name, pizza_name, price, round(price - price * discount / 100) as discount_price, pz.name as pizzeria_name
from person p
join person_order po on p.id = person_id
join menu m on menu_id = m.id
join pizzeria pz on m.pizzeria_id = pz.id
join person_discounts pd on po.person_id = pd.person_id and m.pizzeria_id = pd.pizzeria_id
order by 1, 2