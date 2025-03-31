# dbt Cloud Project - Olist E-commerce Data Pipeline

## 📌 Overview
This project aims to build a **data pipeline** using **dbt Cloud** to process and analyze e-commerce transaction data from Olist (Brazil). The data is extracted from **Google Cloud Storage (GCS)**, loaded into **BigQuery**, and transformed using **dbt** to generate **dimensional and fact tables** for business analysis.

## 📂 Directory Structure
```
/dbt_project/
│-- models/
│   ├── staging/            # Staging models (raw data cleaning)
│   ├── intermediate/       # Intermediate transformations
│   ├── marts/              # Final tables (fact & dimension tables)
│   ├── snapshots/          # Historical tracking
│-- seeds/                  # CSV seed files (lookup tables)
│-- tests/                  # Data quality tests
│-- macros/                 # Custom SQL macros
│-- dbt_project.yml         # dbt project config
│-- README.md               # Project documentation
```
