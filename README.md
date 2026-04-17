Inventory Optimization Analysis

## Overview

This project analyzes inventory data to identify inefficiencies in stock management, including frequent stockouts and overstocking. Using SQL and Python, the analysis uncovers demand patterns and proposes data-driven reorder point strategies to improve inventory performance.

---

## Objectives

* Identify products experiencing frequent stockouts
* Detect overstocked items with low demand
* Analyze demand variability across products
* Develop reorder point recommendations using statistical methods

---

## Tools & Technologies

* **Python** (Pandas, NumPy, Matplotlib)
* **SQL (MySQL)**

---

## Dataset

A synthetic dataset was generated to simulate real-world warehouse operations, including:

* `product_id` – unique identifier
* `date` – daily observation
* `demand` – units sold per day
* `stock_level` – end-of-day inventory
* `lead_time` – restocking delay (days)
* `holding_cost` – cost per unit per day

The dataset includes multiple demand profiles (high, medium, low) to reflect realistic inventory scenarios.

---

## Key Analysis

### 1. Stockout Analysis (SQL)

Identified products with the highest number of stockout days:

```sql
SELECT 
    product_id,
    COUNT(*) AS stockout_days
FROM inventory_data
WHERE stock_level = 0
GROUP BY product_id
ORDER BY stockout_days DESC;
```

---

### 2. Demand vs Inventory (Python)

Compared average demand and inventory levels to detect inefficiencies.

* High demand + low stock → understocked
* Low demand + high stock → overstocked

---

### 3. Reorder Point Calculation

Reorder points were estimated using:

[
ROP = d \times L + SS
]

Where:

* (d) = average demand
* (L) = lead time
* (SS) = safety stock (based on demand variability)

---

## Key Findings

* **Product 2** exhibited high demand and frequent stockouts, indicating insufficient inventory levels
* **Product 8** showed low demand but consistently high inventory, suggesting overstocking
* Inventory allocation across products was imbalanced, leading to both lost sales and increased holding costs

---

## Recommendations

* Increase reorder points and safety stock for high-demand products
* Reduce inventory levels for low-demand items
* Implement demand-driven inventory policies rather than static thresholds

---

## Visualizations

### Stockout Analysis
![Stockout Chart](images/Stockout_Days.png)

### Demand vs Inventory
![Scatter Plot](images/Demand_vs_Inventory.png)

---

## Project Structure

```
inventory-analysis/
│
├── data/
│   └── inventory_data.csv
│
├── sql/
│   └── analysis_queries.sql
│
├── notebooks/
│   └── inventory_analysis.ipynb
│
└── README.md
```

---

## Future Improvements

* Simulate optimized reorder policies and compare performance
* Incorporate service level targets for safety stock calculation
* Build an interactive dashboard (Tableau / Power BI)

---

## Author

Byron Moreira
Computer Science & Mathematics & Statistics Graduate
