# Olist E-Commerce Insights
<p align="center">
  Olist E-Commerce Insights: Analyzing Seller Performance &amp; Sales Trends
</p>

![olistgif](https://github.com/user-attachments/assets/114eddf0-a765-4f78-a3ce-d4af26210a99)

## Table of Contents
1. [Problem statement](#problem-statement)
2. [Project solution](#project-solution)
3. [Tech Stack](#tech-stack)
4. [Prerequisites](#prerequisites)
5. [Datasets](#datasets)
6. [Usage](#usage)
7. [Visualization](#visualization)

## Problem Statement

This project aims to analyze the **top 5 most popular product categories** in the Olist main dataset from **2016 to 2018** and calculate the **total revenue generated** over these three years. Additionally, it explores the relationship between the **main dataset** and the **marketing funnel dataset** to determine the number of sellers who successfully passed the consultant stage (SR).  

Since the **marketing funnel data is only available from June 1 2017, to June 1 2018**, the analysis focuses too on calculating the **total orders placed by these verified sellers**.

Furthermore, this project analyzes:  
✔️ The **total number of customers** linked to the marketing funnel  
✔️ The **total products sold**  
✔️ The **distribution of order statuses**  
✔️ A **time-series analysis** of order trends over time  

---  

## 🔍 Key Questions Explored  

| No. | Research Question |
|----|------------------|
| 1️⃣ | What are the **top 5 most popular product categories** in the Olist dataset from 2016 to 2018? |
| 2️⃣ | What is the **total revenue generated** from product sales over these three years? |
| 3️⃣ | How many sellers **successfully passed the consultant stage (SR)** in the marketing funnel dataset? |
| 4️⃣ | What is the **total number of orders** placed by sellers who passed the SR stage? |
| 5️⃣ | How many **unique customers** are associated with sellers who passed the SR stage? |
| 6️⃣ | What is the **total number of products sold** by sellers who passed the SR stage? |
| 7️⃣ | What is the **distribution of order statuses** across all orders? |
| 8️⃣ | How does the **number of orders change over time**? Are there any noticeable trends or patterns? |
| 9️⃣ | What is the **distribution of customers across different regions**? |

---

## Project Solution

### 1. Data Extraction & Cleaning
- Utilized the **Olist main dataset (2016-2018)** and **Marketing Funnel dataset (2017-2018)**.
- Cleaned data by removing duplicates and handling missing values.

### 2. Data Transformation & Analysis
- Identified **top 5 most popular product categories** based on the number of products sold.
- Calculated **total revenue** from all product sales over three years.
- Merged **marketing funnel dataset** with **main dataset** to determine how many sellers successfully passed the SR stage.
- Measured **total orders**, **total customers**, and **total products sold** from sellers who passed the SR stage.
- Analyzed **order status distribution** to examine the proportion of delivered, canceled, and other orders.
- Conducted **time series analysis** to identify trends and fluctuations in order volume over time.
- Created a **geographical distribution analysis** of customers based on shipping locations.

### 3. Visualization & Insights
- Designed **interactive dashboards** using **Looker Studio**.
- Developed **time series charts**, **order status distribution charts**, **customer location maps**

### Conclusion
This analysis provides insights into Olist's sales trends, popular product categories, seller performance, and customer distribution. By integrating data from the marketing funnel, we can further understand seller progression and their impact on total sales.

## Tech Stack

- **BigQuery**: Data Warehouse.
- **Google Cloud Storage**: Object storage service.
- **Docker**: Containerization.
- **Apache Spark**: Batch Processing.
- **Apache Arrow**: Optimized and merged parquet files
- **dlt**: Data Loading tool.
- **Kestra**: Orchestration.
- **dbt**: Data Transformation tool.
- **Looker Studio**: Data visualization.

## Prerequisites

To successfully run this project, ensure you have the following tools and services set up:

- **Google Cloud Platform (GCP)** Account – Required for using BigQuery as the data warehouse and Google Cloud Storage for storing raw datasets.
- **Docker** – To containerize and manage the execution of different data processing components.
- **Apache Spark** – For batch processing and handling large-scale data transformations.
- **Apache Arrow** – Optimized in-memory data format to process and merge Parquet files efficiently.
- **dlt (Data Loading Tool)** – To facilitate seamless data ingestion and loading.
- **Kestra** – For orchestrating data workflows and automating ETL/ELT pipelines.
- **dbt (Data Build Tool)** – To perform data transformations and manage the data modeling layer.
- **Looker Studio** – For visualizing the insights extracted from the processed data.

Additionally, make sure you have:

1. Python 3.x installed (if custom scripts or dbt models are used).
2. Proper authentication and access permissions to Google Cloud services (BigQuery, GCS).

## Datasets

- Main Datasets: [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- Marketing Funnel Datasets: [Marketing Funnel Datasets](https://www.kaggle.com/datasets/olistbr/marketing-funnel-olist)


