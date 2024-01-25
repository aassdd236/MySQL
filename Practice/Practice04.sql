-- 1 
select count(salary) 
from employees
where salary < (select avg(salary) from employees);

-- 2
select employee_id 직원번호,
	   first_name 이름,
       salary 월급,
       avg(salary),
       max(salary)
from employees
where salary <= (select max(salary) from employees) and
	  salary >= (select avg(salary) from employees)
group by employee_id
order by salary asc;
      
-- 3
select *
from locations l
join departments d on l.location_id=d.location_id
join employees e on e.department_id=d.department_id and e.first_name='Steven' 
					and e.last_name='king';

-- 4
select employee_id 사번,
	   first_name 이름,
       salary 월급
from employees
where salary <any (select salary from employees where job_id='ST_MAN');

-- 5
select employee_id 직원번호,
	   first_name 이름,
	   salary 월급,
       department_id 부서번호
from employees
where (department_id, salary) in (select department_id, max(salary)
								  from employees
                                  group by department_id);
					
-- 6
select j.job_title 업무명,
	   sum(salary) '월급 총합'
from jobs j
join employees e on j.job_id=e.job_id
group by j.job_id
order by sum(salary) desc;

-- 7 
select e.department_id, e.employee_id, e.first_name, e.salary
from employees e, (select department_id, avg(salary) salary
                   from employees
                   group by department_id) s 
where e.department_id = s.department_id
and e.salary > s.salary;

-- 8
select employee_id,
	   first_name,
       salary,
       hire_date
from employees
order by hire_date asc
limit 10, 5;

