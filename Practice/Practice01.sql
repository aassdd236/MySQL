-- 1
select concat(first_name, last_name) 이름,
		salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date asc;
