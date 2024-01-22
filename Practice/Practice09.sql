-- 9
select upper(country_name) 나라이름
from countries
where region_id is not null
order by country_name asc;