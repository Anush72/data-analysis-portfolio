# 🛒 Retail Sales Analytics

Welcome to my **Retail Sales Analytics** project! 

This project explores retail sales data to uncover insights into overall performance, profitability, customer segments, product lines, regional performance, and trends over time using a robust multi-tool stack (**SQL Server, Power Query, Power BI, and Excel**).

---

## 🎯 Project Goals & Architecture

- 📊 **Analyze Performance:** Examine sales, profit, and quantity trends across years, months, regions, and customer segments.
- 🧹 **End-to-End Workflow:** Clean, transform, and model raw retail data into a high-performance star schema.
- 🔍 **Investigate Anomalies:** Use a hypothesis-driven approach to uncover why high-volume categories (like Tables or Phones) can suffer from profitability issues.
- 📈 **Interactive Dashboards:** Build comprehensive Power BI report pages for executive overview and deep product-level analysis.

### 🛠️ Tools & Technologies
- **SQL Server (SSMS):** Advanced querying, CTEs, window functions (`RANK()`), and data aggregation.
- **Power BI & Power Query:** Data transformation, dimensional modeling, and interactive dashboards.
- **Excel:** Supporting data exploration and analysis.

### 🌟 Data Model (Star Schema)
- `Fact_Orders` (Central transactional table)
- `DimProduct` (Product metadata & categorization)
- `DimLocation` (Geographical hierarchy: Region → Country)
- `DimDate` (Calendar time intelligence)

---

## 📑 Core Business Questions Addressed

1. **Sales Performance Over Time:** Tracking Sales, Profit, and Quantity trends annually and monthly (identifying peak vs. low performance periods like December vs. February).
2. **Customer Segment Analysis:** Evaluating profitability and sales contribution across Consumer, Corporate, and Home Office segments.
3. **Category & Sub-Category Performance:** Deep diving into Technology, Office Supplies, and Furniture to find top drivers of volume and profit.
4. **Regional Analysis:** Comparing North and international performance down to the country, category, and product levels.

---

## 💡 Key Findings

* **Sales vs. Profit Disconnect:** Overall Sales and Quantity increased steadily over time, but **Profit did not scale at the same rate**.
* **Seasonal Trends:** **February** was identified as the lowest-performing sales month, while **December** consistently marked the peak performance period across years.
* **Customer Segments:** 
  * The *Consumer* segment generated the highest overall Sales, Profit, and Quantity.
  * The *Corporate* segment saw sales grow, but its **Profit Margin declined over time** (e.g., Corporate Technology → Machines showed sharp margin drops in 2014 due to negative-margin products).
* **Category Dynamics:** 
  * *Technology* generated the highest Sales and Profit, whereas *Office Supplies* recorded the highest total Quantity.
* **Sub-Category Highlights:**
  * **Phones:** High sales volume, but profitability suffered in 2013 due to increased discounting (unprofitable phone products averaged a **22% discount** vs. **13%** for profitable ones).
  * **Tables (Furniture):** Generated substantial sales and increasing quantity but remained **unprofitable** due to heavy discounting and high-loss product lines.
* **Regional Performance (North Region):** 
  * The UK and Mexico were major contributors. In the UK, *Copiers* drove high profits despite low quantities. In Mexico, *Appliances* generated high unit values compared to bulk *Binders*.

---

## 🔬 Hypothesis & Investigation Example: Table Profitability

* **Observation:** Tables show increasing sales and volume, but negative net profitability.
* **Hypothesis:** *Higher discount levels are associated with lower profit margins among Table products.*
* **Investigation Method:** Comparing average discount against profit margin at the product level using scatter plots and drilling down into individual high-loss items to validate the pattern across the full population.

---

## 📊 Power BI Dashboard Structure

* **Overview Page:** High-level metrics (`Total Sales`, `Total Profit`, `Total Quantity`, `Total Products`, `Profit Margin`) with dynamic year, month, category, and region filters, alongside time-series trends and regional sales breakdowns.
* **Product Analysis Page:** Granular tracking of sub-category performance over time (Sales, Profit, Quantity, Profit Margin, and Average Discount) enabling smooth drill-downs from **Category ➔ Sub-Category ➔ Product**.

---

## ✅ Current Project Status

- [x] Dataset understanding & profiling
- [x] Data cleaning & dimensional data modeling (Star Schema)
- [x] Power BI relationships & Calendar (`DimDate`) table setup
- [x] Sales performance, monthly trends, and best/worst month analysis
- [x] Customer segment, category, and sub-category analysis
- [x] Regional & country-level hierarchy analysis (Region → Country → Category → Sub-Category → Product)
- [x] Product-level profitability investigations (Technology/Phones & Furniture/Tables)
- [x] Power BI Overview dashboard development
- [ ] Validate Table discount-profit relationship using the complete product population
- [ ] Finalize Product Analysis & Location Analysis dashboard pages
- [ ] Compile final business insights and recommendations

**Status:** In Progress 🚀
