--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT A.EMP_NO, A.LAST_NAME, A.FIRST_NAME, A.SEX, B.SALARY
FROM EMPLOYEES AS A
JOIN SALARIES AS B ON B.EMP_NO = A.EMP_NO;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1986-01-01' AND '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT A.DEPT_NO, C.DEPT_NAME, A.EMP_NO, B.LAST_NAME, B.FIRST_NAME
FROM DEPT_MANAGER AS A
JOIN EMPLOYEES AS B ON B.EMP_NO = A.EMP_NO
JOIN DEPARTMENTS AS C ON C.DEPT_NO = A.DEPT_NO;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT A.EMP_NO, A.LAST_NAME, A.FIRST_NAME, C.DEPT_NAME
FROM EMPLOYEES AS A
JOIN DEPT_EMP AS B ON B.EMP_NO = A.EMP_NO
JOIN DEPARTMENTS AS C ON C.DEPT_NO = B.DEPT_NO;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT FIRST_NAME, LAST_NAME, SEX
FROM EMPLOYEES
WHERE FIRST_NAME = 'Hercules' AND LAST_NAME like 'B%'
ORDER BY LAST_NAME;

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT C.EMP_NO, C.LAST_NAME, C.FIRST_NAME, A.DEPT_NAME
FROM DEPARTMENTS AS A
JOIN DEPT_EMP AS B ON B.DEPT_NO = A.DEPT_NO
JOIN EMPLOYEES AS C ON C.EMP_NO = B.EMP_NO
WHERE A.DEPT_NAME = 'Sales'
ORDER BY LAST_NAME, FIRST_NAME;

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT C.EMP_NO, C.LAST_NAME, C.FIRST_NAME, A.DEPT_NAME
FROM DEPARTMENTS AS A
JOIN DEPT_EMP AS B ON B.DEPT_NO = A.DEPT_NO
JOIN EMPLOYEES AS C ON C.EMP_NO = B.EMP_NO
WHERE (A.DEPT_NAME = 'Sales' OR A.DEPT_NAME = 'Development')
ORDER BY A.DEPT_NAME, C.LAST_NAME, C.FIRST_NAME;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT LAST_NAME, COUNT(*)
FROM EMPLOYEES
GROUP BY LAST_NAME
ORDER BY LAST_NAME DESC;