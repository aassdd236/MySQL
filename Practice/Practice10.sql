-- 10
select first_name 이름,
	   salary 월급,
       replace(phone_number, '.', '-') '전화 번호',
       hire_date 입사일
from employees
where hire_date < "2003-12-31"