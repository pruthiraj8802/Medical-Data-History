create database project_medical_data_history;

use project_medical_data_history;


-- Q1. Patients who's gender is 'M'.

SELECT first_name, last_name, gender
FROM patients
WHERE gender = 'M';

-- Q2. Patients who do not have allergies (NULL or empty).

SELECT first_name, last_name
FROM patients
WHERE allergies IS NULL OR allergies = '';

-- Q3. Patients whose first name starts with 'C'.

SELECT first_name
FROM patients
WHERE first_name LIKE 'C%';

-- Q4. Patients with weight between 100 and 120 (inclusive). 

SELECT first_name, last_name
FROM patients
WHERE weight BETWEEN 100 AND 120;

-- Q5. Update allergies column where NULL → set to 'NKA'. 

UPDATE patients
SET allergies = 'NKA'
WHERE allergies IS NULL;

SELECT * 
FROM patients;

-- Q6. First + last name concatenated into a single column (full name). 

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patients;

-- Q7. First name, last name, and full province name (assumes provinces table with province_id and province_name). 

SELECT p.first_name, p.last_name, pn.province_name
FROM patients AS p
JOIN province_names AS pn ON p.province_id = pn.province_id;

-- Q8. How many patients have birth_date year = 2010. 

SELECT COUNT(*) AS num_patients_2010
FROM patients
WHERE EXTRACT(YEAR FROM birth_date) = 2010;

-- Q9. Patient(s) with the greatest height (returns first_name, last_name, height). 

SELECT first_name, last_name, height
FROM patients
ORDER BY height DESC
LIMIT 1;

-- Q10. All columns for patients with patient_id in (1,45,534,879,1000). 

SELECT *
FROM patients
WHERE patient_id IN (1, 45, 534, 879, 1000);

-- Q11. Total number of admissions. 

SELECT COUNT(*) AS total_admissions
FROM admissions;

-- Q12. Admissions where admitted and discharged the same day. 

SELECT *
FROM admissions
WHERE admission_date = discharge_date;

-- Q13. Total number of admissions for patient_id = 579. 

SELECT COUNT(*) AS admissions_for_579
FROM admissions
WHERE patient_id = 579;

-- Q14. Unique cities for patients in province_id = 'NS'(assumes province_id stored on patients). 

SELECT DISTINCT city
FROM patients
WHERE province_id = 'NS';

-- Q15. first_name, last_name, birth_date of patients with height > 160 and weight > 70. 

SELECT first_name, last_name, birth_date
FROM patients
WHERE height > 160 AND weight > 70;

-- Q16. Unique birth years ordered ascending. 

SELECT DISTINCT EXTRACT(YEAR FROM birth_date) AS birth_year
FROM patients
ORDER BY birth_year ASC;

-- Q17. Unique first names that occur only once in table. 

SELECT first_name
FROM patients
GROUP BY first_name
HAVING COUNT(*) = 1;

-- Q18. patient_id and first_name starting and ending with 's' (case-insensitive) and at least 6 characters. 

SELECT patient_id, first_name
FROM patients
WHERE LOWER(first_name) LIKE 's%' 
AND LOWER(first_name) LIKE '%s'
AND CHAR_LENGTH(first_name) >= 6;

-- Q19. patient_id, first_name, last_name for patients whose primary diagnosis is 'Dementia'(assumes primary diagnosis stored as diagnosis in admissions).

SELECT p.patient_id, p.first_name, p.last_name
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
WHERE a.diagnosis = 'Dementia';


-- Q20. All patients' first_name ordered by name length then alphabetically. 

SELECT first_name
FROM patients
ORDER BY CHAR_LENGTH(first_name), first_name;

-- Q21. Total male and female patients in same row. 

SELECT
  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- Q22. Total male and female patients in same row.

SELECT
  SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM patients;

-- Q23. patient_id, diagnosis — patients admitted multiple times for the same diagnosis. 

SELECT patient_id, diagnosis, COUNT(*) AS occurrences
FROM admissions
GROUP BY patient_id, diagnosis
HAVING COUNT(*) > 1;

-- Q24. city and total number of patients, ordered most→least patients, then city name ascending. 

SELECT city, COUNT(*) AS num_patients
FROM patients
GROUP BY city
ORDER BY num_patients DESC, city ASC;

-- Q25. first_name, last_name and role for everyone who is either a patient or a doctor (role = 'Patient' or 'Doctor')

SELECT first_name, last_name, 'Patient' AS role
FROM patients
UNION ALL
SELECT first_name, last_name, 'Doctor' AS role
FROM doctors;

-- Q26. All allergies ordered by popularity (exclude NULLs). 

SELECT allergies, COUNT(*) AS cnt
FROM patients
WHERE allergies IS NOT NULL AND allergies <> ''
GROUP BY allergies
ORDER BY cnt DESC;

-- Q27. Patients born in the 1970s decade, sorted from earliest birth_date. 

SELECT first_name, last_name, birth_date
FROM patients
WHERE birth_date BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY birth_date ASC;

-- Q28. Display full name as LASTNAME (UPPER), followed by comma, firstname (lower), order by first_name descending. 

SELECT CONCAT(UPPER(last_name), ',', LOWER(first_name)) AS name_formatted
FROM patients
ORDER BY first_name DESC;

-- Q29. province_id(s) and SUM(height) where total ≥ 7000. 

SELECT province_id, SUM(height) AS total_height
FROM patients
GROUP BY province_id
HAVING SUM(height) >= 7000;

-- Q30. Difference between largest and smallest weight for last_name = 'Maroni'. 

SELECT MAX(weight) - MIN(weight) AS weight_range
FROM patients
WHERE last_name = 'Maroni';

-- Q31. All days of month (1-31) and how many admission_dates occurred on that day, sorted by day with most admissions → least. 

SELECT DAY(admission_date) AS day, COUNT(*) AS total_admissions
FROM admissions
GROUP BY day
ORDER BY total_admissions DESC;

-- Q32. Group patients into 10-kg weight buckets (100→109 = 100, 110→119 = 110, etc.), count per group, ordered by group descending. 

SELECT (FLOOR(weight/10)*10) AS weight_group, COUNT(*) AS total_patients
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC;

-- Q33. patient_id, weight, height, isObese (0 or 1). Using BMI >= 30 as obese threshold. Height in cm, so convert to meters. 

SELECT patient_id, weight, height,
       CASE WHEN (weight / (height/100)*(height/100)) > 30 THEN 1 ELSE 0 END AS isObese
FROM patients;

-- Q34. patient_id, first_name, last_name, attending doctor's specialty for patients diagnosed as 'Epilepsy' where doctor's first_name = 'Lisa'. 

SELECT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients p
JOIN admissions a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';



