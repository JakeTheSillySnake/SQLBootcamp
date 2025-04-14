select name, count(*) as count_of_visits
from person
join person_visits on person.id = person_id
group by name 
having count(*) > 3