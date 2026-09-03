#  Retail Sales Performance & Profitability Analytics Dashboard

##  Project Overview
This project delivers an end-to-end business intelligence solution built for a multi-store retail company. Using a dataset of over 120,000 transaction records (2023–2026), the dashboard evaluates Year-to-Date (YTD Aug 2026) financial health, identifies core revenue drivers, and tracks store performance across 8 regional locations.

![Executive Dashboard - YTD 2026](dashboard_preview.png)

---

##  Business Requirements & Impact

| Business Requirement | Technical Solution | Business Impact & Owner |
| :--- | :--- | :--- |
| **Centralize Regional Sales:** Consolidate multi-year transaction data into a clean analytical architecture. | Modeled a relational database in **PostgreSQL** and established a **Star Schema** in Power BI. | Provides a single source of truth across all 8 regional stores. |
| **Track YTD Financial KPIs:** Monitor revenue, profit margins, and year-over-year growth trajectories. | Created custom **DAX measures** (`Total Revenue`, `Total Profit`, `Profit Margin %`, `YoY Growth %`). | **Execs / Finance:** Enables real-time visibility into overall profitability (**42.09%** margin). |
| **Identify Category Drivers:** Evaluate sales distribution across product categories to optimize strategy. | Built interactive visuals with cross-filtering (Dual-axis trend chart & Donut Chart). | **Sales / Marketing:** Highlighted **Electronics** as the primary driver (**71.97%** of revenue). |

---

##  Step-by-Step Implementation

### Step 1: Data Extraction & Transformation (PostgreSQL)
* Processed raw dataset tables (`sales`, `products`, `stores`).
* Wrote optimized SQL queries using `JOIN`s, `GROUP BY` aggregations, CTEs, and Window Functions (`DENSE_RANK()`, `LAG()`) to analyze sales trends prior to dashboard ingestion.

### Step 2: Data Modeling (Power BI)
* Implemented a clean **Star Schema** linking the central `sales` fact table to dimension tables (`stores`, `products`).
* Developed a dedicated DAX `Calendar` dimension table for Time Intelligence analysis (`SAMEPERIODLASTYEAR`).

### Step 3: Key Financial Metrics (YTD Aug 2026 DAX Measures)
* **Total Revenue:** **$16.16M** — Cumulative YTD revenue generated up to August 2026.
* **Total Profit:** **$6.80M** — YTD net profit performance.
* **Profit Margin %:** **42.09%** — High margin efficiency maintained across all stores (`Total Profit / Total Revenue`).
* **YoY Growth %:** **-0.40%** — Year-over-year performance comparison against the equivalent Jan–Aug period of 2025.

### Step 4: Executive Dashboard Design
* Designed a streamlined single-page interface featuring KPI cards, a dual-axis Line & Clustered Column chart (Monthly Revenue + YoY Growth %), category share breakdown, and a store performance matrix.

---

##  Key Business Insights

1. **Category Dominance:** **Electronics** accounts for **71.97%** ($11.63M) of total YTD revenue, followed by **Furniture** (**23.53%**) and **Stationery** (**4.50%**).
2. **Stable Profit Margins:** The network operates at a solid **42.09% Profit Margin**, demonstrating strong pricing strategies and cost management across all product groups.
3. **Equally Distributed Store Sales:** Revenue is well-balanced across all 8 store locations, ranging from **$1.95M** (*Magazin Vest*) to **$2.10M** (*Magazin Nord*), showing consistent brand demand across all regions.

---

##  Strategic Recommendations

| Action / Recommendation | Target Team (Owner) | Expected Business Impact | Metric to Track (KPI) |
| :--- | :--- | :--- | :--- |
| **Cross-Selling Strategies:** Create bundles pairing high-demand *Electronics* with higher-margin *Stationery / Office* supplies. | **Marketing & Retail Sales** | Boosts basket size and increases revenue in underperforming categories. | *Average Order Value (AOV)* |
| **Regional Sales Optimization:** Target marketing efforts toward stores like *Magazin Vest* ($1.95M) to bring performance closer to top stores (*Magazin Nord*, $2.10M). | **Regional Operations** | Balances revenue performance across all physical locations. | *Revenue per Store* |

---

## 📁 Repository Structure
* `schema_and_queries.sql` – PostgreSQL scripts (table schemas, CTEs, window functions, and joins).
* `Retail_Analytics_Dashboard.pbix` – Interactive Power BI Desktop report file.
* `dashboard_preview.png` – High-resolution preview image of the Executive Dashboard (YTD 2026).
