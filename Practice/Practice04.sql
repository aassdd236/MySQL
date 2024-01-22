-- 4
select job_title 업무의이름,
	   max_salary 최고월급
from jobs
where max_salary >=10000
order by max_salary desc;