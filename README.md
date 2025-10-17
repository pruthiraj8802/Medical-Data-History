<div align="center">
  
# 🏥 Medical Data History — SQL Project

Comprehensive SQL-based analysis of patient, doctor, and hospital admission data.
Includes 34 advanced queries exploring demographics, diagnoses, and healthcare trends
using relational databases and structured datasets.
</div>

## 📘 Project Overview
This project explores and analyzes **medical data** using **SQL**.  
It includes structured datasets for **patients**, **doctors**, **admissions**, and **province names**, focusing on practical SQL querying, data manipulation, and reporting.

The project demonstrates:
- Data extraction using `SELECT` statements  
- Filtering and aggregation queries  
- Table joins and relational lookups  
- Data updates and transformations  
- Analytical insights such as patient demographics and trends

---

## 🧩 Dataset Files
| File Name | Description |
|------------|-------------|
| `Patients.csv` | Contains patient demographic details (name, gender, height, weight, allergies, etc.) |
| `Doctors.csv` | Contains doctor details such as name, specialty, and doctor_id |
| `Admissions.csv` | Stores hospital admission and discharge information, including diagnosis |
| `Province_Names.csv` | Provides province codes and their corresponding full names |

---

## 🧠 SQL Script
**File:** `Medical_Data_History.sql`  

This script includes **34 SQL queries** covering a wide range of database operations such as:

| Query No. | Description |
|------------|-------------|
| 1 | List male patients |
| 2 | Find patients with no allergies |
| 3 | Patients whose first name starts with ‘C’ |
| 4 | Patients with weight between 100–120 |
| 5 | Replace NULL allergies with 'NKA' |
| 7 | Join patients and provinces tables |
| 9 | Find tallest patient |
| 11 | Count total admissions |
| 19 | Find patients diagnosed with 'Dementia' |
| 24 | Count patients per city |
| 33 | Identify obese patients based on BMI |
| 34 | Find patients with 'Epilepsy' treated by Dr. Lisa |

*(Full query list is available in the `.sql` file.)*

---

## 🧾 Documentation & Presentation
- **`Medical_Data_History.docx`** → Contains all SQL queries with explanations.  
- **`Medical_Data_History.pptx`** → PowerPoint version of the project report for presentation purposes.

---

## 🏗️ Database Schema
The project uses the following database:
```sql
CREATE DATABASE project_medical_data_history;
USE project_medical_data_history;
```

**Tables:**
- `patients`
- `doctors`
- `admissions`
- `province_names`

---

## 💡 Key Learnings
- Using SQL to answer analytical questions.
- Cleaning and transforming data using `UPDATE` and `CASE`.
- Working with relational joins and group-based queries.
- Building insights from medical data for better reporting.

---

## 🏁 How to Use
1. Import the `.sql` file into your SQL environment (e.g., MySQL Workbench).  
2. Load the `.csv` files into respective tables.  
3. Run queries from the script to explore and analyze the data.

---

## 👨‍💻 Prepared By
**Name:** Pruthiraj Samal  
**Email:** pruthirajsamal8802@gmail.com  

---

## 🪪 License
This project is licensed under the **MIT License**.  
You are free to use, modify, and distribute this work with proper attribution.

---

<div align="center">

### ⭐ If you found this project insightful, don’t forget to **star the repo**!

</div>
