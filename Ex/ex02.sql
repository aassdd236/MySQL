select now()
from dual; #가상의 이름 줌

-- am을 포함한 사람
select *
from employees
where first_name like '%am%';

-- a가 두번째 글자인 사람
select *
from employees
where first_name like '_a%';

-- 네번째 글자가 a인 사람
select *
from employees
where first_name like '___a%';

-- 이름이 4글자 중에 끝에서 두번째 글자가 a인 사람
select *
from employees
where first_name like '__a_';

-- 월급 13000에서 15000 사이
select *
from employees
where salary between 13000 and 15000;

-- 커미션 비율이 있는 사원
select *
from employees
where commission_pct is not null;

-- 담당 매니저가 없고 커미션 비율이 없는 사람
select *
from employees 
where commission_pct is null and manager_id is null;

-- 부서가 없는 직원
select *
from employees
where department_id is null; 

-- ORDER BY
select first_name, salary
from employees
where salary >= 10000
order by salary asc;

select *
from employees
order by employee_id asc;

-- 부서 본호를 오름차순 정렬
select department_id, salary, first_name
from employees
order by department_id asc;

-- 월급이 10000 이상 월급 큰 직원부터
select first_name, salary
from employees
order by salary desc;

-- 부서번호 오름차순, 월급 높은 사람부터
select department_id, salary, first_name
from employees
order by department_id asc, salary desc;

-- 이름 급여 입사일 이름 알파벳 오름차순
select first_name, salary, hire_date
from employees
order by first_name asc;

-- 이름 급여 입사일 입사일 빠른 사람부터
select first_name, salary, hire_date
from employees
order by hire_date asc;

-- Round
select round(125.123, 2), round(123.123, 0);
	
select round(123.126, -2);

select ceil(123.051);

select concat('안녕', '하세요');
select concat('안녕', '-', '하세요');

select 	first_name,
	lcase(first_name),
	lower(first_name),
         lower('ABCabc!#$%'),
         lower('가나다')
from employees;

select 	length('aa'), char_length('aa'), character_length('aa');

select first_name, substr(first_name,1,3), substr(first_name,-3,2)
from employees
where department_id = 100;

select 	now(), 		
		date_format(now(), '%y-%m-%d %H:%i:%s'),
		date_format(now(), '%Y-%m-%d(%a) %H:%i:%s %p')
from dual;

select str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d');
select str_to_date('2021-06-01 12:30:05', '%Y-%m-%d');

select datediff(str_to_date('2021-Jun-04 07:48:52', '%Y-%b-%d'),            			str_to_date('2021-06-01 12:30:05', '%Y-%m-%d')
               );

