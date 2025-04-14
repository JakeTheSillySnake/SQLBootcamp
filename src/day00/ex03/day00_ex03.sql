select person_id from person_visits where pizzeria_id = 2 
    or visit_date between '2022-01-06' and '2022-01-09' 
group by person_id
order by person_id desc;