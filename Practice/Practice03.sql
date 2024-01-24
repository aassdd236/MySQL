-- 1
select e.employee_id 사번, 
	   e.first_name 이름,
       e.last_name 성,
       d.department_name 부서명
from employees e, departments d
where e.department_id=d.department_id
order by d.department_name asc, e.employee_id desc;

-- 2
select e.employee_id 사번,
	   e.first_name 이름,
       e.salary 월급,
       d.department_name 부서명,
       j.job_title 현재업무
from employees e, departments d, jobs j
where e.department_id=d.department_id and e.job_id=j.job_id
order by e.employee_id asc;

-- 2-1
select e.employee_id 사번,
	   e.first_name 이름,
       e.salary 월급,
       d.department_name 부서명,
       j.job_title 현재업무
from employees e
left outer join departments d on e.department_id=d.department_id
left outer join jobs j on e.job_id=j.job_id
order by e.employee_id asc;

-- 3
select l.location_id 도시아이디,
	   l.city 도시명,
       d.department_name 부서명,
       d.department_id 부서아이디
from locations l, departments d
where l.location_id=d.location_id
order by l.location_id asc;

-- 3-1
select l.location_id 도시아이디,
	   l.city 도시명,
       d.department_name 부서명,
       d.department_id 부서아이디
from locations l
left outer join departments d on l.location_id=d.location_id
order by l.location_id asc;

-- 4
select r.region_name 지역이름,
	   c.country_name 나라이름
from regions r
left outer join countries c on r.region_id=c.region_id;

-- 5
select e.employee_id 사번,
	   e.first_name 이름,
       e.hire_date 채용일,
       m.first_name 매니저이름,
       m.hire_date 매니저입사일
from employees e, employees m
where e.manager_id=m.employee_id and e.hire_date<m.hire_date;

-- 6
select c.country_name 나라명,
	   c.country_id 나라아이디,
       l.city 도시명,
       l.location_id 도시아이디,
       d.department_name 부서명,
       d.department_id 부서아이디
from locations l, departments d, countries c 
where l.location_id=d.location_id and l.country_id=c.country_id
order by country_name asc;

-- 7
select j.employee_id 사번,
	   concat(first_name, last_name) 이름,
       j.job_id 업무아이디,
       j.start_date 시작일,
       j.end_date 종료일
from job_history j, employees e
where j.employee_id=e.employee_id and j.job_id='AC_ACCOUNT';

-- 8
select d.department_id 부서번호,
	   d.department_name 부서이름,
       m.first_name 매니저이름,
       l.city 도시,
       c.country_name 나라이름,
       r.region_name 지역이름
from departments d
join employees m on m.employee_id = d.manager_id
left outer join locations l on d.location_id = l.location_id
left outer join countries c on l.country_id = c.country_id
left outer join regions r on r.region_id = c.region_id;
      
-- 9      
select e.employee_id 사번,
	   e.first_name 이름,
       d.department_name 부서명,
       m.first_name 매니저이름
from employees e
left outer join departments d on e.department_id=d.department_id
left outer join employees m on e.manager_id=m.employee_id;

-- 9-1
select e.employee_id 사번,
	   e.first_name 이름,
       d.department_name 부서명,
       m.first_name 매니저이름
from employees e
left outer join departments d on e.department_id=d.department_id
left outer join employees m on e.manager_id=m.employee_id
where e.manager_id is not null;

select e.employee_id 사번,
	   e.first_name 이름,
       d.department_name 부서명,
       m.first_name 매니저이름
from employees e
join employees m  on e.manager_id=m.employee_id
left outer join departments d on e.department_id=d.department_id;


-- 9-2
select e.employee_id 사번,
       e.first_name 이름,
	   d.department_name 부서명,
       m.first_name 매니저이름
from employees e, employees m, departments d
where e.manager_id = m.employee_id and e.department_id = d.department_id;
