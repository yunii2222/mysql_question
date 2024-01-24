-- Q1.
-- 재직 중이고 휴대폰 마지막 자리가 2인 직원 중 입사일이 가장 최근인 직원 3명의 사원번호,
-- 직원명, 전화번호, 입사일, 퇴직여부를 출력하세요.
-- 참고. 퇴사한 직원은 퇴직여부 컬럼값이 ‘Y’이고, 재직 중인 직원의 퇴직여부 컬럼값은 ‘N’
SELECT
	emp_id,
    emp_name,
    phone,
    hire_date,
    ent_yn
FROM
	employee
WHERE
	phone LIKE '%2' AND
    ent_yn = 'N'
ORDER BY 
	hire_date DESC
LIMIT 3;

-- Q2.
-- 재직 중인 ‘대리’들의 직원명, 직급명, 급여, 사원번호, 이메일, 전화번호, 입사일을 출력하세요.
-- 단, 급여를 기준으로 내림차순 출력하세요.

SELECT 
	a.emp_name,
    a.job_code,
    b.job_name,
    a.salary,
	a.emp_id,
    a.email,
    a.phone,
    a.hire_date,
    a.ent_yn
FROM
	employee a
JOIN
-- job b 의 카테고리 안에 a.job_code 와 b.job_code를 JOIN하겠다.
    job b ON a.job_code = b.job_code
WHERE
	a.job_code = 'j6' AND
	a.ent_yn = 'N'
ORDER BY
	a.salary DESC;
    
-- Q3.
-- 재직 중인 직원들을 대상으로 부서별 인원, 급여 합계, 급여 평균을 출력하고, 마지막에는 
-- 전체 인원과 전체 직원의 급여 합계 및 평균이 출력되도록 하세요.
-- 단, 출력되는 데이터의 헤더는 컬럼명이 아닌 ‘부서명’, ‘인원’, ‘급여합계’, ‘급여평균’으로 출력되도록 하세요.

SELECT
    b.dept_title AS '부서명',
    COUNT(*) AS '인원',
    SUM(a.salary) AS '급여합계',
    AVG(a.salary) AS '급여평균'
FROM
    employee a
CROSS JOIN
    department b
WHERE
    a.ent_yn = 'N'
GROUP BY 
    b.dept_title
WITH ROLLUP;

-- Q4.
-- 전체 직원의 직원명, 주민등록번호, 전화번호, 부서명, 직급명을 출력하세요.
-- 단, 입사일을 기준으로 오름차순 정렬되도록 출력하세요.

SELECT 
	a.emp_name,
    a.emp_no,
    a.phone,
    b.dept_title,
	a.job_code
FROM
	employee a
LEFT JOIN 
	    department b ON a.dept_code = b.dept_id
JOIN 
	job c ON a.job_code = c.job_code
ORDER BY 
		a.hire_date;
        
-- Q5.
-- <1단계> 전체 직원 중 연결된 관리자가 있는 직원의 인원을 출력하세요.
-- 참고. 연결된 관리자가 있다는 것은 관리자사번이 NULL이 아님을 의미함
SELECT 
	COUNT(*)
FROM
	employee 
WHERE 
	manager_id IS NOT NULL
 ORDER BY 
	emp_name;

-- <2단계> 1단계에서 조회한 내용에는 문제가 조금 있습니다. 관리자사번이 존재하여 연결된
-- 관리자가 있기는 하나, 해당 관리자가 직원 목록에 존재하지 않는 직원이 있습니다.
-- 따라서 1단계를 디벨롭하여 직원 목록에 관리자사번이 존재하는 직원의 인원을 출력하세요.
SELECT 
	COUNT(*)
FROM
	employee a
JOIN 
	employee b ON a.manager_id = b.emp_id
 ORDER BY 
	a.emp_name;


-- <3단계> 모든 직원의 직원명과 관리자의 직원명을 출력하세요.
-- 참고. ‘모든 직원’이므로 관리자가 존재하지 않는 직원도 출력되어야 합니다.

-- <4단계> 관리자가 존재하는 직원의 직원명, 부서명, 관리자의 직원명, 관리자의 부서명을 출력하세요.






		
	









