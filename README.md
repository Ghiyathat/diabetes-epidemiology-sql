## Diabetes Epidemiology and Prevalence Analysis

### Table of Contents
1. [Project Overview](#project-overview)
2. [Data Sources](#data-sources)
3. [Tools](#tools)
4. [Data Preparation](#data-preparation)
5. [Exploratory Data Analysis](#exploratory-data-analysis)
6. [Analysis Framework](#analysis-framework)
7. [Key Analytical Questions](#key-analytical-questions)
8. [Methodological-Approach](#methodological-approach)
9. [Results](#results)
10. [Limitations](#limitations)
11. [References](#references)

### Project Overview

A SQL data exploration project utilizing Diabetes Database. The workflow encompasses data analysis and calculation of disease prevalence across different demographics. This repository demonstrates the application of database querying techniques to derive meaningful insights from healthcare data.

### Data Sources
Diabetes Data: The primary dataset used for this analysis is the [diabetes.csv](https://github.com/user-attachments/files/22701181/diabetes.csv) file, containing detailed information about the metrics used.

### Tools
- Excel: Data Cleaning [Download Here](https://github.com/user-attachments/files/22701181/diabetes.csv)
- SQL Server: Data Analysis

### Data Preparation
- Data loading and formatting
- Renaming columns to improve clarity
- Sorting

### Exploratory Data Analysis
This exploratory analysis examines a clinical diabetes dataset to identify key risk factors, prevalence patterns, and demographicrelationships associated with diabetes outcomes. The analysis follows a structured approach from basic descriptive statistics to advanced cohort segmentation.

### Analysis Framework
1. Descriptive Statistics & Population Health
- Overall Diabetes Burden: Established baseline prevalence rates across the population
- Demographic Distribution: Analyzed age groups, BMI categories, and clinical measurements
- Health Metrics Comparisons: Compared average values (glucose, BP, BMI, Insulin) between diabetic andnon diabetic groups
2. Risk Factor Correlation Analysis
- Glucose levels: Investigated the direct relationship between blood glucose and diabetes diagnosis
- Blood Pressure: Examined hypertension as a comorbidity factor
- Genetic Predisposition: Analyzed diabetes pedegree function impact on outcomes
3. High Risk Cohort Identification
- Age- Specific Analysis: Segmented prevalence across different age brackets
- BMI Stratification: Categorized risk by body mass index ranges

### Key Analytical Questions
Population Health:
- What is the overall diabetes prevalence in the dataset?
- How are key health metrics distributed between between diabetic and non diabetic groups?
Risk Factor Investigation:
- How strongly do glucose level correlate with diabetes outcomes?
- Does blood pressure show signifigant comorbidity with diabetes?
- What is the relationship between genetic predisposition (pedegree function) and diabetes likelihood?
- How does the number of pregnancies relate to diabetes risk?
Demographic Patterns:
- How does diabetes prevalence change across different age groups?
- What BMI categories show the highest diabetes burden?
- Can we identify specific high risk demographic profiles?

  ### Methodological Approach
  - SQL-Based Analysis: Leveraged CASE statements and aggregation methods
  - Statistical Comparisons: Used average comparisons, prevalence calculations, and distribution analysis

  ```sql
  SELECT*
    CASE
       WHEN BMI < 18.5 THEN 'Underweight'
       WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
       WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
       ELSE 'Obese'
     END AS bmi_category,
     COUNT(*) AS total_people,
     ROUND(100.0* SUM(Outcome)/ COUNT(*),2) AS diabetes_prevalence_percent
  FROM idkportfolio.diabetes
  GROUP BY bmi_category
  ORDER BY diabetes_prevalence_percent DESC;
### Results
1. Demographic and Clinical profile:
- Diabetic individuals are, on average, older(37.1 vs 31.2 years) and have a higher BMI (35.1 VS 30.3) compared to non diabetics
- critical clinical markers are markedly worse in the diabetic group: average glucose is 141.3 mg/dl (diabetic range) versus 110.0 mg/dl (pre- diabetic range), and average insulin is 100.3 versus 68.8, suggesting insulin resistance.
2. Strong Correlation with Modifiable Risk Factors:
- Glucose level: The most direct correlate. Prevalence excalates dramatically from 8.1% in the normal range to 68.8% in the high range (141-200 mg/dl).
- BMI(Body Mass Index): A clear dose-response relationship exists. Diabetes prevalence is nearly seven times higher in obese individuals (46.4%) compared to those with a normal BMI (6.9%)
- Blood Pressure: Hypertension is a significant comorbidity. Prevalence rises from 31.6% in those with normal BP to 49.2% in stage 1 Hypertension
3. Impact of Non-Modifiable Risk Factors:
- Age: Prevalence rises steadily with age, peaking at 59.7% for the 50-59 age group, before a notable drop in the 60+ cohorts. This drop could be due to survival bias or a smaller sample size.
- Genetic Predisposition: The diabetes Pedegree Function shows a strong association. Individuals with a very high genetic risk have double the prevalence(54.6%) than those with low genetic risk (27.0%)
4. Pregnancy and Diabetes Risk:
- The relationship is non-linear.

### Recommendations
- Targeted Screening programs
- Tiered Intervention strategies

### Limitations
Key confounders like diet, socioeconomic status, and smoking are not included in this dataset.

### References
[pima-indians-diabetes-csv](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.kaggle.com/datasets/kumargh/pimaindiansdiabetescsv&ved=2ahUKEwimxI3th4uQAxUVWUEAHf4RD4cQFnoECDwQAQ&sqi=2&usg=AOvVaw1gXtYDFa_BZ_YLLcCDg0sF)
