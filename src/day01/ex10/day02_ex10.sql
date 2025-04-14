select A.name as person_name1, B.name as person_name2, A.address as common_address
from person A
left join person B on A.address = B.address and A.id > B.id
where B.name is not null
order by person_name1, person_name2, common_address