-- 2
select job_title 업무이름,
		max_salary 최고월급
from jobs
order by max_salary desc;
