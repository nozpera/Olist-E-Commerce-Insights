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
6. [Main Process](#main-process)
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

## Main Process

**1. Setting Up Kestra Workflow Orchestration**

The first step in the pipeline is to install and run Kestra for workflow orchestration using Docker. This is done as follows:

  - Navigate to the **kestra** directory, where the Kestra Docker Compose configuration is located.
  - Run the following command to build and start Kestra:
    ```sh
    docker-compose up
    ```
  - Once the setup is complete, Kestra can be accessed via **localhost:8080** in a web browser.
    ![Capture](https://github.com/user-attachments/assets/087c0b6a-7fa5-43da-8e69-a1e682b09ca0)

**2. Setting Up Google Cloud Platform (GCP) in Kestra**

Next, we configure Google Cloud Storage (GCS) and BigQuery in Kestra to facilitate data storage and processing.

  - First, copy the contents of your GCP credentials JSON file and store them as a key-value pair in Kestra.
    ![Capture 3](https://github.com/user-attachments/assets/b1a557e6-5a6e-4311-8166-534029f80008)

  - Then, create a new flow under the designated namespace for this project with the ID gcp_kv.
  - The YAML configuration for this step is available in:
    ```sh
    kestra/flows/gcp_kv.yml
    ```

**3. Creating GCS Buckets & BigQuery Dataset + Raw Data Extraction**

Once GCP is set up in Kestra, the next step is to create:

- A Google Cloud Storage (GCS) bucket to serve as a data lake.
  ![Capture 4](https://github.com/user-attachments/assets/3d141678-a12d-43f0-b61b-c5e520b9414e)

- A BigQuery dataset to store structured data for analysis.

The project-1.yml file in the Kestra directory handles:

1. GCP setup (creating the necessary storage & database resources).
2. Extracting raw datasets and uploading them to GCS for further processing.
   ![6](https://github.com/user-attachments/assets/9655cade-dd97-491b-a675-c0dce1c89010)

**4. Loading Raw Dataset from GCS (Data Lake) to BigQuery (Data Warehouse)**

In this stage, the raw dataset stored in Google Cloud Storage (GCS) is loaded into BigQuery using a Python script. The script leverages Apache Spark, Apache Arrow, and DLT, each playing a crucial role in optimizing data ingestion. The workflow follows these steps:

![7](https://github.com/user-attachments/assets/d2cd2a07-c23f-4b2c-8cd0-2aeeb023e3d1)

*Step 1: Batch Processing with Apache Spark*
  - Apache Spark is used for efficient batch processing.
  - The raw dataset is repartitioned to ensure parallel execution and optimal resource utilization.
  - A fixed schema is defined at the beginning to enforce data consistency before ingestion into BigQuery.

*Step 2: Optimized Parquet Processing with Apache Arrow*
  - The partitioned Spark DataFrame is written as multiple Parquet files.
  - Apache Arrow merges these partitioned Parquet files into a single optimized Parquet file.
  - This step improves query performance and reduces storage overhead.

*Step 3: Efficient Data Loading with DLT*
  - The merged Parquet file is then passed to DLT (Data Loading Tool).
  - DLT ensures optimized ingestion into BigQuery by handling schema mapping and efficient bulk loading.
  - This step significantly enhances the performance and reliability of the ELT pipeline.

Note: By following this structured workflow, the data loading process remains scalable, efficient, and optimized for large datasets. 🚀

**5. Data Transformation with dbt**

After loading the raw dataset into BigQuery, the next step is to perform data transformation using dbt (Data Build Tool). This step ensures that the data is cleaned, structured, and optimized for analysis.
![8](https://github.com/user-attachments/assets/4513d2dc-5eca-4595-92d2-a045cdba53c0)

*Step 1: Creating Dimensional and Fact Tables*
  - The transformation process follows a dimensional modeling approach, separating dimension tables (e.g., dim_orders_details, dim_geolocation_customers) and fact tables (e.g., facts_orders_customer).
  - Key transformations include:
    - Aggregating total orders and revenue.
    - Joining multiple datasets (orders, payments, sellers, customers).
    - Extracting and standardizing product categories.

*Step 2: Data Cleaning and Standardization*
  - Product category names are cleaned and formatted using a custom dbt macro to ensure consistency (e.g., converting construction_tools_safety to Construction Tools Safety).
  - Payment types are categorized using a dbt macro (get_payment_type.sql).
  - Order statuses and shipping details are validated to ensure accurate reporting.

*Step 3: Filtering Data for Marketing Funnel Analysis*
  - Since the marketing funnel dataset covers only June 1, 2017 – June 1, 2018, the analysis filters relevant orders and sellers from this period.
  - The number of sellers who passed the consultant stage (SR) is identified and linked with total orders and customers.

*Step 4: Materializing Data Models*
  - dbt models are incrementally updated to optimize query performance.
  - Final models include:
    - Marts tables (marts_sold_products, marts_geolocation_olist) for aggregated insights.
    - Time series transformations for trend analysis.
    - Order status percentage calculations for visualization.

By leveraging dbt, the data pipeline remains scalable, modular, and efficient, ensuring high-quality data for downstream analytics and visualization. 🚀

## Visualization

Once the data has been successfully transformed and stored in BigQuery, the next step is to visualize insights using Looker Studio. The key objectives of this visualization phase are:
1. Connecting to BigQuery
   - Set up a connection between Looker Studio and the processed tables in BigQuery.
   - Ensure that key fact and dimension tables are properly structured for reporting.
2. Building Dashboards & Reports
   - Top 5 Popular Product Categories: A tabular or ranking table showing the most purchased product categories from 2016 to 2018.
   - Total Revenue Analysis: A horizontal bar chart displaying revenue trends across the three years.
   - Seller Performance in Marketing Funnel: A dashboard showing the number of sellers who passed the consultant stage (SR) and their corresponding sales data.
   - Order Status Distribution: A pie chart or stacked bar chart visualizing the percentage breakdown of order statuses.
   - Time-Series Order Trends: A line chart representing order trends over time, highlighting seasonality and sales peaks.
   - Geographical Customer & Seller Distribution: A map visualization displaying customer and seller locations, helping to understand regional sales performance.
3. Customizing Reports
   - Rename columns to user-friendly names for better readability
   - Optimize dashboard performance by using pre-aggregated tables in BigQuery to reduce query execution time.
4. Sharing & Monitoring
   - Publish the dashboard and share it with stakeholders.
   - Schedule automated report updates to reflect the latest data.

This visualization step ensures that the insights derived from the data pipeline are effectively communicated to decision-makers, enabling data-driven strategies for business growth.

Here are the link for the visualization in looker studio: [Olist E-Commerce Dashboard](https://lookerstudio.google.com/u/0/reporting/d3977873-f684-4598-bf51-13efc79edd9a/page/qlD)

**Snapshots dashboard**
![9](https://github.com/user-attachments/assets/2a1004c1-823a-4383-9a2e-c9575525385a)

## Conclusion & Acknowledgment
This project has been an incredible journey in building a scalable and efficient end-to-end data pipeline, from data ingestion to transformation and visualization. By leveraging BigQuery, dbt, Apache Spark, Kestra, and Looker Studio, I was able to gain hands-on experience in modern data engineering workflows, enabling deeper insights into e-commerce sales performance.

I would like to express my sincere gratitude to DataTalks.Club and Alexey Grigorev for providing an outstanding learning platform through the Data Engineering Zoomcamp. Their guidance and resources have been instrumental in helping me develop the skills needed to design and implement real-world data solutions.

This project is just the beginning, and I look forward to continuously improving and exploring new challenges in the data engineering field. 🚀

Thank you! 🙌
