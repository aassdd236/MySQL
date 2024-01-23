-- 1
select count(employee_id) haveMngCnt
from employees
where manager_id is not null;

-- 2
select max(salary) 최고임금,
	   min(salary) 최저임금,
       max(salary)-min(salary) '최고임금-최저임금'
from employees;

-- 3
select date_format(max(hire_date), '%Y년 %m월 %e일') 날짜
from employees
where hire_date is not null;

-- 4
select avg(salary) 평균임금,
	   max(salary) 최고임금,
       min(salary) 최저임금,
       department_id 부서아이디
from employees
group by department_id
order by department_id desc;

-- 5 ㄴㄴ
select avg(salary) 평균임금,
	   max(salary) 최고임금,
	   min(salary) 최저임금,
       job_id 업무
from employees
group by job_id
order by min(salary) desc, round(avg(salary), 0) asc;

-- 6
select date_format(min(hire_date), '%Y-%m-%d %W')
from employees;

-- 7
select department_id 부서,
	   avg(salary) 평균임금,
       min(salary) 최저임금,
       avg(salary)-min(salary) '(평균임금-최저임금)'
from employees
group by department_id
having avg(salary)-min(salary)<2000
order by avg(salary)-min(salary) desc;

-- 8
select job_id 업무,
       max(salary)-min(salary) 차이
from employees
group by job_id
order by 차이 desc;

-- 9
select manager_id 관리자,
	   round(avg(salary), 0) 평균급여,
       min(salary) 최소급여,
       max(salary) 최대급여
from employees
group by manager_id
having avg(salary)>=5000
order by avg(salary) desc;

-- 10
select hire_date,
	   case when hire_date <='02/12/31' then '창립멤버'
			when hire_date <='03/12/31' then '03년입사'
            when hire_date <='04/12/31' then '04년입사'
			else '상장이후입사'
		end 입사일
from employees 
order by hire_date asc;

-- 11
 /*CASE weekday
        WHEN 'Sunday' THEN SET korean_weekday = '일요일';
        WHEN 'Monday' THEN SET korean_weekday = '월요일';
        WHEN 'Tuesday' THEN SET korean_weekday = '화요일';
        WHEN 'Wednesday' THEN SET korean_weekday = '수요일';
        WHEN 'Thursday' THEN SET korean_weekday = '목요일';
        WHEN 'Friday' THEN SET korean_weekday = '금요일';
        WHEN 'Saturday' THEN SET korean_weekday = '토요일';
    END CASE; */
select date_format(min(hire_date), '%Y년 %m월 %e일(%a)') 입사일
from employees;




