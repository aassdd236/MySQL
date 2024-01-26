-- 1
select first_name 이름,
      manager_id 매니저아이디,
       commission_pct 커미션비율,
       salary 월급
from employees
where manager_id is not null and
     commission_pct is null and
      salary > 3000;
      
-- 2 
select employee_id 직원번호,
       first_name 이름,
       max(salary) 월급,
      concat(hire_date, ' ', (case when date_format(min(hire_date), '%a') = 'mon' then '월요일'
         when date_format(min(hire_date), '%a') = 'thu' then '화요일'
         when date_format(min(hire_date), '%a') = 'wed' then '수요일'
         when date_format(min(hire_date), '%a') = 'thr' then '목요일'
         when date_format(min(hire_date), '%a') = 'fri' then '금요일'
         when date_format(min(hire_date), '%a') = 'sat' then '토요일'
         else '일요일'
           end)) 입사일,
       replace(phone_number,'.','-') 전화번호, 
       department_id 부서번호
from employees
group by department_id, employee_id
having (department_id, max(salary)) in (select department_id, max(salary) salary
                                                       from employees
                                                       group by department_id)
order by salary desc;

-- 3
select e.manager_id,
      m.first_name,
       avg(e.salary),
       min(e.salary),
       max(e.salary)
from employees e
join employees m on e.manager_id=m.employee_id
where e.hire_date>'2004-12-31'
group by e.manager_id, m.employee_id
having avg(e.salary) >=5000
order by avg(e.salary) desc;

-- 4
select e.employee_id 사번,
      e.first_name 이름,
       d.department_name 부서명,
       m.first_name 매니저이름
from employees e
join employees m on e.manager_id=m.employee_id
left outer join departments d on e.department_id=d.department_id;

-- 5
select e.employee_id 사번,
      e.first_name 이름,
       d.department_name 부서명,
       e.salary 월급,
       e.hire_date 입사일
from employees e
join departments d on e.department_id=d.department_id
where hire_date >= '2005-01-01'
order by hire_date asc
limit 10, 10;

-- 6
select concat(first_name, ' ', last_name) 이름,
      e.salary 월급,
       d.department_name 부서이름,
       e.hire_date
from employees e, departments d
where e.department_id=d.department_id and
     e.hire_date = (select max(hire_date) from employees);











-- 10
select j.job_title,
       e.salary
from employees e
join jobs j on e.job_id=j.job_id
where e.salary= (select max(salary) from employees);