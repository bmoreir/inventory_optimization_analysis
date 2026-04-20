CREATE TABLE inventory (
    product_id INT,
    date DATE,
    demand INT,
    stock_level INT,
    lead_time INT,
    holding_cost FLOAT
);


-- Days out of stock
SELECT product_id, COUNT(*) AS stockout_days
FROM inventory
WHERE stock_level = 0
GROUP BY product_id
ORDER BY stockout_days DESC;

-- Average demand per product
SELECT product_id, AVG(demand) AS avg_demand, MAX(demand) AS peak_demand
FROM inventory
GROUP BY product_id;

-- High number of days out of stock and high demand
SELECT i.product_id, AVG(i.demand) AS avg_demand, COUNT(CASE WHEN i.stock_level = 0 THEN 1 END) AS stockout_days
FROM inventory i
GROUP BY i.product_id
ORDER BY stockout_days DESC, avg_demand DESC;

-- Reorder point
SELECT product_id, AVG(demand) AS avg_demand, MAX(lead_time) AS lead_time, (AVG(demand) * MAX(lead_time)) AS reorder_point
FROM inventory
GROUP BY product_id;

-- Overstock vs understock
SELECT product_id, AVG(stock_level) AS avg_stock, AVG(demand) AS avg_demand, COUNT(CASE WHEN stock_level = 0 THEN 1 END) AS stockout_days
FROM inventory
GROUP BY product_id;
