# Association Between Depression and Marital Status in U.S. Adults (BRFSS 2014)

This repository contains the analysis and SAS code for a study examining the relationship between depression and marital status among adults aged 18–99 in the United States. The analysis uses 2014 BRFSS (Behavioral Risk Factor Surveillance System) data.

## Objective
To investigate whether marital status is associated with depression among U.S. adults, while controlling for:
- Sex  
- Age  
- Region  
- Exercise behavior  

## Data Source
The analysis uses data from the **Centers for Disease Control and Prevention (CDC)**:
- **BRFSS 2014 dataset**
- Final analytical sample: **443,724 adults**
- All participants lived in the 50 states or Washington, D.C.

## Methods
### Statistical Tests
- Pearson Chi-Square tests to examine associations between variables  
- Logistic regression to estimate adjusted odds ratios (ORs) and 95% confidence intervals  
- Backward elimination used to build an improved interaction model  

### Variables
- **DEPRESS**: 0 = No depression diagnosis, 1 = Yes  
- **MARITAL1**: 0 = Not married, 1 = Married  
- **SEX1**: 0 = Male, 1 = Female  
- **AGE1**: 0 = 18–44, 1 = 45–69, 2 = 70–99  
- **REGION**: Northeast, Midwest, South, West  
- **EXERCISE**: 0 = No exercise, 1 = Exercised in past month  

## Results Summary
- Married individuals had **9.2%–54% lower odds** of reporting depression compared to non-married individuals, depending on sex, age, and exercise.
- Females had nearly **double the odds** of depression compared to males.
- Individuals aged 45–69 had higher odds of depression; individuals 70–99 had lower odds.
- Exercisers had significantly lower odds of reporting depression.
- Interaction model showed improved fit (AUC increased from 0.6275 to 0.6461).

## Repository Contents
- **depression_marital_status_analysis.sas**  
  Complete SAS code used for data cleaning, recoding, and analysis.

- **README.md**  
  Overview of project, dataset, and methodology.

- (Optional) You may upload the PDF report if you want:
  `Depression_MaritalStatus_Report.pdf`

## How to Use
1. Download the SAS file.  
2. Update the file path to your `.XPT` BRFSS dataset.  
3. Run the script in SAS (SAS Studio, Base SAS, or SAS OnDemand).

## Author
Misato Nasu  
National University — ANALYTICS 625: Categorical Data Methods  
Instructor: Dr. Kevin Duffy-Deno (Dec 2023)

