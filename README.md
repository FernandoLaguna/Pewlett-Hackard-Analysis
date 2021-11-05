# Pewlett-Hackard-Analysis

## Overview of the project
Two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. The prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

## Results:

1. There are more 90,398 employees retiring
2. The title with more employees retiring is Senior Engineer and followed by Senior Staff

![Retiring_Titles](/retiring_titles_png.png)

3. There are 1,940 employees for the mentorship program


## Summary:


1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?
Seven roles

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
We have 1,1940 employees for the mentoring program

We can extend the program of mentorship to employyes that were born in 1966, using the next query
```-- Create a table joining employees and Department employee table
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
WHERE (em.birth_date BETWEEN '1966-01-01' AND '1966-12-31')
ORDER BY emp_no, to_date DESC;```

