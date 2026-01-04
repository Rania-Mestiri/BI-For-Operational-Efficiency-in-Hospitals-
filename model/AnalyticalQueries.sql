-- Analytical SQL queries answering business questions:

-- Average patient waiting time per department
SELECT d.department_name,
       AVG(f.waiting_time_minutes) AS avg_waiting_time
FROM fact_patient_visit f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department_name;

-- Waiting time by shift
SELECT s.shift_name,
       AVG(f.waiting_time_minutes) AS avg_waiting_time
FROM fact_patient_visit f
JOIN dim_shift s ON f.shift_id = s.shift_id
GROUP BY s.shift_name;

-- Department with highest patient volume
SELECT d.department_name,
       SUM(f.patient_volume_shift) AS total_patients
FROM fact_patient_visit f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_patients DESC;

-- Department with lowest satisfaction
SELECT d.department_name,
       AVG(f.satisfaction_score) AS avg_satisfaction
FROM fact_patient_visit f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg_satisfaction ASC;

-- Doctor utilization by department
SELECT d.department_name,
    AVG(f.doctor_utilization_rate) AS avg_utilization_rate
FROM fact_patient_visit f
JOIN dim_department d ON f.department_id = d.department_id
GROUP BY d.department_name;

-- Overutilized and underutilized doctors
SELECT doctor_id,
    AVG(doctor_utilization_rate) AS avg_utilization_rate
FROM fact_patient_visit
GROUP BY doctor_id
HAVING AVG(doctor_utilization_rate) > 0.72
    OR AVG(doctor_utilization_rate) < 0.50
ORDER BY avg_utilization_rate DESC;

-- Relationship between waiting time and satisfaction
SELECT 
    AVG(waiting_time_minutes) AS avg_waiting_time,
    AVG(satisfaction_score) AS avg_satisfaction
FROM fact_patient_visit;
