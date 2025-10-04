SELECT * FROM idkportfolio.diabetes;

-- Total number of individuals in a dataset and how many are diabetic vs non diabetic
SELECT COUNT(*) AS total_individuals, SUM(Outcome) AS diabetic_count, COUNT(*)- SUM(Outcome) AS non_diabetic_count FROM idkportfolio.diabetes;

-- The overall sample size and the prevalence of diabetes within the dataset
SELECT COUNT(*) AS total_individuals, SUM(Outcome) AS diabetic_count, COUNT(*)- SUM(Outcome) AS non_diabetic_count, ROUND((SUM(Outcome) * 100/COUNT(*)),2) AS diabetic_prevalence_percent FROM idkportfolio.diabetes;

-- Diabetes prevalence by BMI Category; 
SELECT CASE WHEN BMI < 18.5 THEN 'Underweight' WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal' WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight' ELSE 'Obese' END AS bmi_category, COUNT(*) AS total_people, ROUND(100.0* SUM(Outcome)/ COUNT(*),2) AS diabetes_prevalence_percent FROM idkportfolio.diabetes GROUP BY bmi_category ORDER BY diabetes_prevalence_percent DESC;

-- The average key metrics by Diabetes Outcome
SELECT Outcome, COUNT(*) AS count, ROUND(AVG(Age),2) AS average_age, ROUND(AVG(BMI),2) AS average_bmi, ROUND(AVG(Glucose),2) AS average_glucose, ROUND(AVG(BloodPressure),2) AS average_bp, ROUND(AVG(Insulin),2) AS average_insulin FROM idkportfolio.diabetes GROUP BY Outcome;

-- This identifies if diabetes prevalence increases with age and how diabetes are distributed across age groups
SELECT CASE WHEN Age < 20 THEN 'Under 20' WHEN Age BETWEEN 20 AND 29 THEN '20 - 29' WHEN Age BETWEEN 30 AND 39 THEN '30 - 39' WHEN Age BETWEEN 40 AND 49 THEN '40 - 49' WHEN Age BETWEEN 50 AND 59 THEN '50 - 59' WHEN Age BETWEEN 60 AND 69 THEN '60 - 69' WHEN AGE >= 60 THEN 'Over 60' ELSE 'Unknown' END AS age_group, COUNT(*) AS total_people, SUM(Outcome) AS diabetic_count, ROUND(100.0* SUM(Outcome)/COUNT(*),2) AS diabetic_prevalence_percent, ROUND(100.0 * SUM(Outcome)/(SELECT SUM(Outcome) FROM idkportfolio.diabetes),2) AS diabetic_distribution_percent FROM idkportfolio.diabetes GROUP BY age_group ORDER BY MIN(Age);

-- The correlation between glucose levels and diabetes outcome
SELECT CASE WHEN Glucose < 100 THEN 'Normal (<100)' WHEN Glucose BETWEEN 100 AND 125 THEN 'Prediabetic (100-125)' WHEN Glucose BETWEEN 126 AND 140 THEN 'Borderline Diabetic (126 - 140)' WHEN Glucose BETWEEN 141 AND 200 THEN 'High (141- 200)' ELSE 'Very High(>200)' END AS glucose_range, COUNT(*) AS total_patient, SUM(Outcome) AS diabetic_patient, ROUND(100.0 * SUM(Outcome)/COUNT(*),2) AS diabetic_prevalent_percent FROM idkportfolio.diabetes GROUP BY glucose_range ORDER BY MIN(Glucose);

-- Diabetes Prevalence by Pregnancy Count
SELECT Pregnancies AS pregnancy_count, COUNT(*) AS total_women, SUM(Outcome) AS diabetic_count, ROUND(100.0*SUM(Outcome)/COUNT(*),2) AS diabetic_prevalence_percent FROM idkportfolio.diabetes GROUP BY Pregnancies ORDER BY Pregnancies;

SELECT CASE WHEN Glucose < 100 THEN 'Normal (<100)' WHEN Glucose BETWEEN 100 AND 125 THEN 'Prediabetic (100-125)' WHEN Glucose BETWEEN 126 AND 140 THEN 'Borderline Diabetic (126 - 140)' WHEN Glucose BETWEEN 141 AND 200 THEN 'High (141- 200)' ELSE 'Very High(>200)' END AS glucose_range, COUNT(*) AS total_patient, SUM(Outcome) AS diabetic_patient, ROUND(100.0 * SUM(Outcome)/COUNT(*),2) AS diabetic_prevalent_percent FROM idkportfolio.diabetes GROUP BY glucose_range ORDER BY MIN(Glucose);

-- Diabetes Prevalence by Blood Pressure Category
SELECT CASE WHEN BloodPressure < 80 THEN 'Normal(<80)' WHEN BloodPressure BETWEEN 80 AND 89 THEN 'Elevated (80 -89)' WHEN BloodPressure BETWEEN 90 AND 119 THEN 'Hypertension Stage 1 (90 -119)' WHEN BloodPressure >= 120 THEN 'Hypertension Stage 2 (120+)' ELSE 'Impossible (>120)' END AS bp_category, COUNT(*) AS total_patients, SUM(Outcome) AS diabetic_count, ROUND(100.0 * SUM(Outcome)/COUNT(*),2) AS diabetes_prevalence_percent, ROUND(AVG(Age),2) AS average_age, ROUND(AVG(Glucose),2) AS average_glucose FROM idkportfolio.diabetes GROUP BY bp_category ORDER BY MIN(BloodPressure);

-- Diabetes Prevelance by Pedegree function categories
SELECT CASE WHEN DiabetesPedigreeFunction < 0.3 THEN 'Low Genetic Risk (<0.3)' WHEN DiabetesPedigreeFunction BETWEEN 0.3 AND 0.6 THEN 'Moderate Risk (0.3-0.6)' WHEN DiabetesPedigreeFunction BETWEEN 0.61 AND 1.0 THEN 'High Risk (0.61-1.0)' ELSE 'Very High Risk (>1.0)' END AS genetic_risk_category, COUNT(*) AS total_patients, SUM(Outcome) AS diabetic_count, ROUND(100.0 * SUM(Outcome)/COUNT(*),2) AS diabetic_prevalent_percent FROM idkportfolio.diabetes GROUP BY genetic_risk_category ORDER BY MIN(DiabetesPedigreeFunction);