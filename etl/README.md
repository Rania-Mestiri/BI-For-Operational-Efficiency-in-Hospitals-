# Data Preparation & ETL
This step focuses on cleaning, transforming, and preparing raw hospital visit data for analysis and visualization.

## Data Source
The raw dataset was synthetically generated using Python to simulate real hospital operations. Each row represents a single patient visit handled by a doctor in a specific department during a defined shift.

## ETL Steps Performed
### 1. Data Loading
The raw CSV file was loaded into a Python (pandas) environment using Google Colab.
### 2. Data Quality Assessment
- Checked for missing values
- Identified duplicates
- Reviewed data distributions and ranges
### 3. Data Cleaning
- Removed duplicate records
- Handled missing values using median (numeric) and default labels (categorical)
- Standardized column names
### 4. Data Transformation
- Converted date and time columns to datetime format
- Created derived fields:
  - Waiting time (minutes)
  - Consultation duration (minutes)
  - Doctor utilization rate
### 5. Outlier Treatment
- Removed unrealistic waiting times
- Ensured doctor utilization does not exceed 100%

## Output
The final output of this step is a clean dataset ready for BI analysis and Power BI visualization.
