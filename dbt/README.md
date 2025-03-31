# dbt Cloud Project - Olist E-commerce Data Pipeline

## 📌 Overview
Proyek ini bertujuan untuk membangun **data pipeline** menggunakan **dbt Cloud** untuk memproses dan menganalisis data transaksi e-commerce dari Olist (Brazil). Data diambil dari Google Cloud Storage (GCS), disimpan dalam **BigQuery**, lalu ditransformasikan menggunakan **dbt** untuk menghasilkan tabel dimensional dan fact yang siap digunakan untuk analisis bisnis.

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

## 🚀 Getting Started
### 1️⃣ Setup Environment
Pastikan dbt sudah dikonfigurasi di dbt Cloud dan terkoneksi ke BigQuery.

### 2️⃣ Running dbt Commands
Jalankan perintah berikut untuk mengelola pipeline:

#### 📌 Compile dan jalankan model transformasi
```
dbt run
```

#### 📌 Cek data lineage dan dokumentasi
```
dbt docs generate && dbt docs serve
```

#### 📌 Lakukan testing pada model
```
dbt test
```

#### 📌 Jalankan model incremental
```
dbt run --select my_model+
```

## 📊 Data Model
Berikut beberapa tabel utama yang dihasilkan:

- **stg_orders**: Membersihkan data order dari raw data.
- **stg_customers**: Transformasi dan deduplikasi data pelanggan.
- **dim_customers**: Tabel dimensi pelanggan yang siap digunakan untuk analisis.
- **fact_orders**: Tabel fakta transaksi yang menghubungkan order dengan produk, pelanggan, dan pembayaran.

## ✅ Best Practices
- Gunakan **staging models** untuk membersihkan dan menstandarkan schema data.
- Terapkan **testing (`dbt test`)** untuk memastikan kualitas data.
- Gunakan **macros** untuk menghindari duplikasi SQL.
- Dokumentasikan semua model menggunakan `dbt docs`.

---

💡 **Contributors**: _Ryan Permana
📅 **Last Updated**: _March 2025_

