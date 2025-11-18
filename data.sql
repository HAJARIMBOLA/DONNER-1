--1. Afficher l’id, first_name, last_name des employés qui n’ont pas d’équipemployee.
SELECT id, first_name, last_name
FROM employee
WHERE team_id IS NULL;
--2. Afficher l’id, first_name, last_name des employés qui n’ont jamais pris de congé.
SELECT employee.id, employee.first_name, employee.last_name
FROM employee
LEFT JOIN leave l ON employee.id = l.employee_id
WHERE l.id IS NULL;
--3. Afficher les congés avec id du congé, début, fin, nom & prénom de l’employé, nom de son
équipemployee.
SELECT l.id AS leave_id, l.start_date, l.end_date,
employee.first_name, employee.last_name, t.name AS team_name
FROM leave l
JOIN employee  ON l.employee_id = employee.id
LEFT JOIN team t ON employee.team_id = t.id;
-- 4. Afficher le nombre d’employés par contract_typemployee.
SELECT c.label AS contract_type,
COUNT(employee.id) AS total_employees
FROM contract_type c
LEFT JOIN employee ON employee.contract_type_id = c.id
GROUP BY c.label;
--5. Afficher le nombre d’employés en congé aujourd’hui.
SELECT COUNT(DISTINCT employee_id) AS nb_employees_on_leave
FROM leave
WHERE CURRENT_DATE BETWEEN start_date AND end_date;
--6. Afficher id, nom, prénom + nom équipe des employés en congé aujourd’hui.
SELECT employee.id, employee.first_name, employee.last_name, t.name AS team_name
FROM employee e
JOIN leave l ON l.employee_id = employee.id
LEFT JOIN team t ON employee.team_id = t.id
WHERE CURRENT_DATE BETWEEN l.start_date AND l.end_date;