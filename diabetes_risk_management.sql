USE healthcare

Total patients
SELECT COUNT(*) AS total_patients
FROM diabetes


# TOTAL PATIENTS AS DIABETIC OR NON DIABETIC
SELECT
    Diabetes_Status,
    COUNT(*) AS Patient_Count
FROM diabetes
GROUP BY Diabetes_Status;


# AVERAGE GLUCOSE BY STATUS
SELECT
    Diabetes_Status,
    ROUND(AVG(Glucose),2) AS Avg_Glucose
FROM diabetes
GROUP BY Diabetes_Status;


# AVERAGE BMI BY STATUS
SELECT
    Diabetes_Status,
    ROUND(AVG(BMI),2) AS Avg_BMI
FROM diabetes
GROUP BY Diabetes_Status;


# HIGH RISK PATIENTS
SELECT COUNT(*) AS High_Risk_Patients
FROM diabetes
WHERE Glucose > 140 AND BMI > 30;


# RISK LEVEL SEGMENTING
SELECT
    CASE
        WHEN Glucose > 160 THEN 'High Risk'
        WHEN Glucose BETWEEN 120 AND 160 THEN 'Moderate Risk'
        ELSE 'Low Risk'
    END AS Risk_Level,
    COUNT(*) AS Patient_Count
FROM diabetes
GROUP BY Risk_Level
ORDER BY Patient_Count DESC;


# HIGH RISK AMONG DIABETES
SELECT COUNT(*) AS High_Risk_Diabetics
FROM diabetes
WHERE Diabetes_Status = 'Diabetic'
AND Glucose > 160;


# TOP 5 PATIENTS REQUIRING IMMIDIATE ATTENTION
SELECT Age, Glucose, BMI
FROM diabetes
ORDER BY Glucose DESC
LIMIT 5;


# BMI IMPACT ON DIABETES
SELECT
    Diabetes_Status,
    ROUND(AVG(BMI),2) AS Avg_BMI
FROM diabetes
GROUP BY Diabetes_Status;


# RANK PATIENTS BY GLUCOSE LEVEL
SELECT
    Age,
    Glucose,
    ROW_NUMBER() OVER (ORDER BY Glucose DESC) AS Glucose_Rank
FROM diabetes;