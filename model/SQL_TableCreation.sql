CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT,
    month INT,
    month_name VARCHAR(20),
    day INT,
    weekday VARCHAR(20)
);

CREATE TABLE dim_department (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50),
    available_beds INT
);

CREATE TABLE dim_shift (
    shift_id SERIAL PRIMARY KEY,
    shift_name VARCHAR(20)
);

CREATE TABLE dim_doctor (
    doctor_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE fact_patient_visit (
    appointment_id INT PRIMARY KEY,
    patient_id INT,

    doctor_id INT,
    department_id INT,
    shift_id INT,
    date_id DATE,

    waiting_time_minutes FLOAT,
    consultation_duration_minutes FLOAT,

    patient_volume_shift INT,
    patients_seen_by_doctor_shift INT,

    doctor_available_minutes INT,
    doctor_worked_minutes INT,
    doctor_utilization_rate FLOAT,

    satisfaction_score INT
);

ALTER TABLE fact_patient_visit
ADD CONSTRAINT fk_doctor
FOREIGN KEY (doctor_id) REFERENCES dim_doctor(doctor_id);

ALTER TABLE fact_patient_visit
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES dim_department(department_id);

ALTER TABLE fact_patient_visit
ADD CONSTRAINT fk_shift
FOREIGN KEY (shift_id) REFERENCES dim_shift(shift_id);

ALTER TABLE fact_patient_visit
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id) REFERENCES dim_date(date_id);

SELECT COUNT(*) FROM dim_doctor;
SELECT COUNT(*) FROM dim_department;
SELECT COUNT(*) FROM dim_shift;
SELECT COUNT(*) FROM dim_date;
SELECT COUNT(*) FROM fact_patient_visit;

SELECT * FROM fact_patient_visit LIMIT 10;

SELECT
    f.appointment_id,
    d.department_name,
    s.shift_name,
    dt.year,
    f.waiting_time_minutes
FROM fact_patient_visit f
JOIN dim_department d ON f.department_id = d.department_id
JOIN dim_shift s ON f.shift_id = s.shift_id
JOIN dim_date dt ON f.date_id = dt.date_id
LIMIT 10;
