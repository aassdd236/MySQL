-- 1
select concat(first_name, last_name) 이름,
		salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date asc;

-- 2
select job_title 업무이름,
		max_salary 최고월급
from jobs
order by max_salary desc;

-- 3
select first_name 이름,
	   manager_id 매니저아이디,
       commission_pct 커미션비율,
       salary 월급
from employees
where commission_pct is null and salary >3000
order by salary desc;

-- 4
select job_title 업무의이름,
	   max_salary 최고월급
from jobs
where max_salary >=10000
order by max_salary desc;

-- 5
select first_name 이름,
	   salary 월급,
       ifnull(commission_pct, 0) 커미션퍼센트
from employees
where salary < 14000 and salary > 10000
order by salary desc;

-- 6
select first_name 이름,
	   salary 월급,
       date_format(hire_date, "%Y-%m") 입사일,
       department_id 부서번호
from employees
where department_id in (10, 90, 100);

-- 7
select first_name 이름,
	   salary 월급
from employees
where first_name like '%s%';

-- 8
select *
from departments
order by length(department_name) desc; 

-- 9
select upper(country_name) 나라이름
from countries
where region_id is not null
order by country_name asc;

-- 10
select first_name 이름,
	   salary 월급,
       replace(phone_number, '.', '-') '전화 번호',
       hire_date 입사일
from employees
where hire_date < "2003-12-31"