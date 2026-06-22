# Data Analyst Portfolio Project: SQL Data Exploration (MySQL)

## Project Overview
This repository contains a comprehensive SQL script demonstrating advanced data exploration and data preparation techniques using global COVID-19 datasets (tracking metrics for deaths and vaccinations). This project adapts the data pipeline and queries specifically for **MySQL Workbench on macOS**. The core focus is on transforming, filtering, and structuring raw data to extract meaningful metrics and stage clean, optimized tables for future business intelligence (BI) visualizations.

## SQL Skills Showcased
* **Data Cleansing & Filtering:** Handling database-specific syntax variations by converting SSMS null-checks into MySQL-compatible empty string filters (`where continent != ''`) to isolate sovereign nations from continent totals.
* **Aggregations & Calculations:** Formulating compound mathematical statements to compute real-time metrics such as dynamic case-fatality rates and positive testing percentages relative to total populations.
* **Windows Functions & Running Totals:** Utilizing `SUM(...) OVER (PARTITION BY ... ORDER BY ...)` execution loops to engineer rolling cumulative counts of daily vaccination rollouts over time per country.
* **Advanced Query Structures (CTEs):** Constructing Common Table Expressions (`With PopvsVac`) to execute downstream mathematical logic on newly generated windows-function columns.
* **Session Optimization (Temporary Tables):** Provisioning local session staging schemas via `CREATE TEMPORARY TABLE` blocks to load, partition, and query temporary data pipelines.
* **Database Views for BI Integration:** Writing persistent `CREATE VIEW` objects to freeze finalized query schemas, enabling seamless, live-query capabilities with data visualization software like Tableau or Power BI.

## Environment & Tech Stack
* **Operating System:** macOS
* **Database Management System (DBMS):** MySQL
* **SQL Client Interface:** MySQL Workbench

## Datasets Used
* **COVID-19 Deaths Dataset:** Structural history tracks population sizes, daily localized cases, and cumulative death counts.
* **COVID-19 Vaccinations Dataset:** Granular tracking of modern rollout paces, testing variations, and daily immunization counts.

## Script Blueprint & Analytical Milestones
1. **Baseline Ingestion Exploration:** Extracting the fundamental relationship of localized infections relative to foundational population baselines.
2. **Case-Fatality Assessment (Total Cases vs. Total Deaths):** Calculating the localized probability of mortality upon contracting the virus over specific timelines.
3. **Peak Infection Benchmarking:** Pinpointing macro-level saturation levels by identifying nations with the highest infection counts compared to their total population.
4. **Continent-Level Demographics:** Isolating geographic patterns by breaking down peak global death counts across primary continental boundaries.
5. **Global Aggregation Timelines:** Utilizing `SUM` aggregates to chart a timeline of the shifting global crude mortality index.
6. **Rolling Vaccination Progression:** Implementing data engineering logic to track continuous daily progress curves of global vaccine administrations.
