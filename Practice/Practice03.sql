-- 3
select first_name 이름,
	   manager_id 매니저아이디,
       commission_pct 커미션비율,
       salary 월급
from employees
where commission_pct is null and salary >3000
order by salary desc;