# Data Preparation & ETL
This step focuses on cleaning, transforming, and preparing raw hospital visit data for analysis and visualization.

## Data Source
The raw dataset was synthetically generated using Python to simulate real hospital operations. Each row represents a single patient visit handled by a doctor in a specific department during a defined shift.

## ETL Steps Performed
### 1. Data Loading
The raw CSV file was loaded into a Python environment using VS Code.
### 2. Data Quality Assessment
- Checked for missing values
- Identified duplicates
### 3. Data Cleaning
- Removed duplicate records
- Handled missing values 
### 4. Data Transformation
- Converted date and time columns to datetime format
- Created derived fields:
  - Waiting time (minutes)
  - Consultation duration (minutes)
  - Doctor utilization rate
  - 
## Files
- `Etl_clean.ipynb` → Data cleaning notebook
- `DataDictionary.png` → Description of all fields
