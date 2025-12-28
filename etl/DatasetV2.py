import pandas as pd
import numpy as np
from datetime import datetime, timedelta

np.random.seed(42)
rows = 12000  # >10,000 rows

departments = [
    "Emergency", "Cardiology", "Neurology",
    "Pediatrics", "Orthology", "Dermatology"
]

shifts = ["Morning", "Night"]

data = []

start_date = datetime(2024, 1, 1)

for i in range(1, rows + 1):
    visit_date = start_date + timedelta(days=np.random.randint(0, 365))
    shift = np.random.choice(shifts)

    check_in = visit_date + timedelta(hours=np.random.randint(6, 20))
    waiting_minutes = np.random.randint(5, 180)
    consultation_start = check_in + timedelta(minutes=waiting_minutes)
    consultation_duration = np.random.randint(10, 40)
    check_out = consultation_start + timedelta(minutes=consultation_duration)

    record = {
        "appointment_id": i,
        "patient_id": np.random.randint(1000, 5000),
        "doctor_id": np.random.randint(1, 120),
        "department": np.random.choice(departments),
        "visit_date": visit_date.date(),
        "shift": shift,
        "check_in_time": check_in,
        "consultation_start_time": consultation_start,
        "check_out_time": check_out,
        "available_beds": np.random.randint(10, 60),
        "patient_volume_shift": np.random.randint(30, 250),
        "patients_seen_by_doctor_shift": np.random.randint(5, 30),
        "doctor_available_minutes": 480,
        "doctor_worked_minutes": np.random.randint(200, 480),
        "satisfaction_score": np.random.randint(1, 6)
    }

    data.append(record)

df = pd.DataFrame(data)

df.to_csv("Hospital_visits_raw.csv", index=False)

print(df.head())
print(f"\nDataset generated with {len(df)} rows.")
