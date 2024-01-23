select count(first_name)
from employees;

select count(commission_pct)
from employees;

select count(*),
	   sum(salary),
	   avg(salary)
from employees;

-- -----------------
# group by
-- -----------------
select department_id, avg(salary)
from employees
group by department_id
order by department_id asc;

-- 단일행함수
select 	first_name,
		salary,
        round(salary, 2)
from employees;

-- 그룹함수
select sum(salary)
from employees;

-- 오류
select 	first_name,
		salary,
        sum(salary)
from employees;
-- ------------------------------
# count()
-- ------------------------------
select *
from employees;

select count(*)
from employees;

select count(first_name)
from employees;

select count(manager_id)
from employees;

select count(commission_pct)
from employees;

select count(*), count(commission_pct)
from employees;


-- 월급이 16000 초과 되는 직원의 수는?
select count(commission_pct)
from employees
where salary > 16000
;

-- ------------------------------
# sum()
-- ------------------------------
select 	count(*), 
		sum(salary),
        sum(employee_id)
from employees
;


-- ------------------------------
# avg()   null 포함여부 주의
-- ------------------------------
select 	count(*),
		sum(salary),
        avg(salary)
from employees
;


-- ------------------------------
# max() / min()
-- ------------------------------
select 	count(*),
		max(salary),
        min(salary)
from employees
;

select max(salary)
from employees
;


-- ------------------------------
# GROUP BY 절
-- ------------------------------
-- 부서번호, 월급 출력
select department_id, salary
from employees
;

-- department_id 로 그룹후 그룹별로 max값과 평균값 출력
-- 그룹번호가 필요 
select max(salary), avg(salary)
from employees
group by department_id
;

-- 그룹에 참여한 컬럼은 select절에 사용할 수 있다, 그룹의 대표값
select department_id, max(salary), avg(salary)
from employees
group by department_id
;

-- 그룹에 참여하지 않는 컬럼명은 사용할 수 없다
select department_id, max(salary), avg(salary), first_name
from employees
group by department_id
;


-- 그룹을 세분화  그룹안에 그룹만들기
-- 그룹에 참여한 컬럼명은 select 절에 사용할 수 있다
select department_id, job_id, max(salary), avg(salary)
from employees
group by department_id, job_id
;


# 월급(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 월급합계를 출력하세요
-- where절에는 그룹함수를 쓸수 없다  
-- 합계를 계산하기전에 where절을 실행한다
select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
group by department_id
;  


-- ------------------------------
# HAVING 절
-- ------------------------------
select department_id, count(*), sum(salary)
from employees
-- where sum(salary) >= 20000
where department_id = 100
group by department_id
having sum(salary) >= 20000;
-- and department_id = 100;  

-- if~else 문
select 	first_name,
 		salary,
		commission_pct,
	   if(commission_pct is null, 0, 1) as state
from employees;

-- switch
SELECT employee_id, 
       salary, 
	   job_id,
	   CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
			WHEN job_id = 'SA_REP'     THEN salary + salary * 0.2
		    WHEN job_id = 'ST_CLERK'   THEN salary + salary * 0.3
		    ELSE salary
	 END realsalary
FROM employees;

-- ppt 19p
select first_name
	   department_id,
       case when department_id >=10 and department_id <=50
       then 'A-TEAM'
       when department_id >=60 and department_id <=100
       then 'B-TEAM'
       when department_id >=110 and department_id <=150
       then 'C-TEAM'
       ELSE '팀없음'
       end 부서코드
from employees;


-- -------------
# join
-- -------------
select first_name, department_name
from employees, departments;

select *
from employees e inner join departments d
on e.department_id=d.department_id;

select first_name,
	   e.department_id,
       department_name,
       d.department_id
from employees e, departments d
where e.department_id=d.department_id;

select first_name,
	   department_name,
       job_title
from employees e, departments d, jobs j
where e.department_id=d.department_id and e.job_id=j.job_id;

-- 이름, 부서번호, 부서명, 업무아이디, 업무명, 도시아이디, 도시명
select e.first_name,
	   e.department_id,
       d. department_name,
       j.job_title,
       l.location_id,
       l.city
from employees e, departments d, jobs j, locations l
where e.department_id=d.department_id and e.job_id=j.job_id
	  and d.location_id=l.location_id;
      
	