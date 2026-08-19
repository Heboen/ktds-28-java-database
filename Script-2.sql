-- 1. 이름이 'S'로 시작하는 사원을 조회하시오.
SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME 
	 , EMAIL
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE 'S%'
;
-- 2. 이름에 'an'이 포함된 사원을조회하시오.
SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME 
	 , EMAIL
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE FIRST_NAME LIKE '%an%'
;
-- 3. EMAIL이 'A'로 끝나는 사원을 조회하시오.
SELECT EMPLOYEE_ID
	 , FIRST_NAME
	 , LAST_NAME 
	 , EMAIL
	 , PHONE_NUMBER 
	 , HIRE_DATE 
	 , JOB_ID 
	 , SALARY 
	 , COMMISSION_PCT 
	 , MANAGER_ID 
	 , DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE EMAIL LIKE '%S'
;
-- 4. 이름을 모두 대문자로 변환해 조회하시오.
SELECT UPPER(FIRST_NAME)
  FROM EMPLOYEES
;
-- 5. 성을 모두 소문자로 변환해 조회하시오.
SELECT LOWER(FIRST_NAME)
  FROM EMPLOYEES
;
-- 6. 전체 사원 수를 조회하시오.
SELECT COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
;
-- 7. 전체 사원의 급여 합계를 조회하시오.
SELECT SUM(SALARY)
  FROM EMPLOYEES
;
-- 8. 전체 사원의 평균 급여를 조회하시오.
SELECT AVG(SALARY)
  FROM EMPLOYEES
;
-- 9. 가장 높은 급여와 가장 낮은 급여를 함께 조회하시오.
SELECT MIN(SALARY)
	 , MAX(SALARY)
  FROM EMPLOYEES
;
-- 10. 부서별 사원 수를 조회하시오.
SELECT COUNT(EMPLOYEE_ID)
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
;
-- 11. 부서별 평균 급여를 조회하시오.
SELECT AVG(SALARY)
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID 
;
-- 12. 직무아이디별 최고 급여와 평균 급여를 조회하시오.
SELECT MAX(SALARY)
	 , AVG(SALARY)
	 , JOB_ID 
  FROM EMPLOYEES
 GROUP BY JOB_ID  
;
-- 13. 부서아이디별, 직무아이디별 사원 수를 함께 조회하시오.
SELECT COUNT(JOB_ID )
	 , COUNT(DEPARTMENT_ID )
  FROM EMPLOYEES
;
-- 14. 상사번호별로 관리하는 사원 수를 조회하시오.
SELECT COUNT(EMPLOYEE_ID )
  FROM EMPLOYEES
 GROUP BY MANAGER_ID 
;
-- 15. 사원 수가 5명 이상인 부서번호만 조회하시오.
SELECT
  FROM EMPLOYEES e
;
-- 16. 평균 급여가 8000 이상인 부서아이디만 조회하시오.

-- 17. 최고 급여가 15000을 초과하는 직무아이디만 조회하시오.

-- 18. 부서별 급여 합계가 30000을 초과하는 부서아이디만 조회하시오.

-- 19. 관리하는 사원이 2명 이상인 매니저만 조회하시오.

-- 20. 부서별 급여 합계가 30000을 초과하는 부서아이디만 조회하시오.

-- 21. 관리하는 사원이 2명 이상인 매니저만 조회하시오.

-- 22. 전체 평균 급여보다 높은 급여를 받는 사원을 조회하시오.

-- 23. 'IT' 부서에서 근무하는 사원을 조회하시오.

-- 24. 가장 급여가 높은 사원을 조회하시오.

-- 25. 'King'이라는 성을 가진 사원과 같은 부서에서 근무하는 사원을 조회하시오. (본인 제외)

-- 26. 사원이 한 명도 없는 부서번호와 부서명을 조회하시오.

-- 28. 직무변경 이력이 있는 사원의 이름과 성을 조회하시오.

-- 29. 직무변경 이력이 없는 사원의 이름과 성을 조회하시오.