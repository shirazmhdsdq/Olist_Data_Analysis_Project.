# Olist E-Commerce Sales & Delivery Performance Analysis

## 📌 Project Overview
This project analyzes the sales performance and delivery efficiency of Olist, a Brazilian e-commerce platform. The goal was to identify revenue hotspots and evaluate supply chain bottlenecks by calculating late-delivery rates across different states.

## 🛠️ Tech Stack & Tools
* **Python (Pandas, SQLAlchemy):** Automated data ingestion from raw CSV files into a relational database.
* **MySQL:** Executed complex queries using Common Table Expressions (CTEs), multi-table JOINs, and Window Functions to calculate Average Order Value (AOV) and rank delivery delays.
* **Power BI:** Built a star-schema data model and authored DAX measures to visualize total revenue and regional performance.

## 📂 Files in this Repository
* `data_ingestion.py`: The Python script used to bypass manual wizards and automate the ETL pipeline directly into MySQL.
* `delivery_performance_analysis.sql`: The master SQL script aggregating order values and ranking states by late-delivery percentages.
* `Olist_Sales_Dashboard.pbix`: The interactive Power BI dashboard file.
* `Dashboard_Screenshot.png`: A static view of the final Power BI visualizations.

## 📊 Key Findings
* **Revenue Concentration:** A significant portion of total revenue (13.59M BRL) is concentrated in specific regions, primarily São Paulo (SP).
* **Delivery Delays:** By converting string dates to native DATETIME formats, the analysis successfully identified states with the highest rates of delayed deliveries, providing actionable insights for logistics optimization.