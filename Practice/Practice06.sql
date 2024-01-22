-- 6
select first_name 이름,
	   salary 월급,
       date_format(hire_date, "%Y-%m") 입사일,
       department_id 부서번호
from employees
where department_id in (10, 90, 100);