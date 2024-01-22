-- 5
select first_name 이름,
	   salary 월급,
       ifnull(commission_pct, 0) 커미션퍼센트
from employees
where salary < 14000 and salary > 10000
order by salary desc;