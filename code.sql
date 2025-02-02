
-- Data Analysis

-- 1. Top Performing Categories by Revenue
-- Question: Which categories generate the highest revenue?
SELECT ci.category, SUM(oi.total_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_icons ci ON p.category = ci.category
GROUP BY ci.category
ORDER BY total_revenue DESC;


-- 2. Customer Segments Analysis
-- Question: What is the revenue contribution from each customer segment?
SELECT customer_segment, SUM(o.order_total) AS total_revenue
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY customer_segment
ORDER BY total_revenue DESC;

-- 4. Sentiment Analysis on Customer Feedback
-- Question: What is the sentiment distribution in customer feedback?
SELECT sentiment, COUNT(*) AS feedback_count
FROM customer_feedback
GROUP BY sentiment
ORDER BY feedback_count DESC;

-- 5. Inventory Shrinkage Analysis
-- Question: What is the percentage of damaged stock for each product?
SELECT product_id, 
       SUM(damaged_stock) / SUM(stock_received) * 100 AS damaged_percentage
FROM inventory
GROUP BY product_id
ORDER BY damaged_percentage DESC;

-- 6. ROI Analysis on Marketing Campaigns
-- Question: Which marketing campaigns had the best Return on Ad Spend (ROAS)?
SELECT campaign_id, campaign_name, ROAS
FROM marketing_performance
ORDER BY ROAS DESC
LIMIT 5;

-- 7. Delivery Performance Insights
-- Question: Which delivery partner has the highest percentage of on-time deliveries?
SELECT delivery_partner_id, 
       SUM(CASE WHEN delivery_status = 'On Time' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS on_time_percentage
FROM delivery_performance
GROUP BY delivery_partner_id
ORDER BY on_time_percentage DESC;

-- 8. Average Order Value by Area
-- Question: What is the average order value for each area?
SELECT c.area, AVG(o.order_total) AS avg_order_value
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
GROUP BY c.area
ORDER BY avg_order_value DESC;

-- 9. High-Performing Products
-- Question: Which are the top 5 products by revenue?
SELECT p.product_name, SUM(oi.total_price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 10. Marketing Channel Effectiveness
-- Question: Which marketing channels are the most effective in generating revenue?
SELECT channel, SUM(revenue_generated) AS total_revenue
FROM marketing_performance
GROUP BY channel
ORDER BY total_revenue DESC;
