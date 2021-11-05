-- Create a table joining employees and Titles
SELECT em.emp_no, em.first_name, em.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_table
FROM employees as em
LEFT JOIN Titles as ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_table
ORDER BY emp_no, to_date DESC;

-- Employee count by department number
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Create a table joining employees and Department employee table
SELECT DISTINCT ON (emp_no) em.emp_no,
em.first_name, 
em.last_name, 
em.birth_date, 
de.from_date, 
de.to_date, 
ti.title
INTO mentorship_eligibilty
FROM employees as em

INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no, to_date DESC;