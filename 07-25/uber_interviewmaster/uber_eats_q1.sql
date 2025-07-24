-- Title: Eats Order Tracking Partner Performance Evaluation
-- Date: 2025-07-24
-- Source: Interview Master AI
-- Difficulty: Easy
-- Link : https://www.interviewmaster.ai/chat/eff20170-da1a-4810-92cd-14d5d8745b11

-- Q1. What is the percentage of orders delivered on time in January 2024? Consider an order on time if its actual_delivery_time is less than or equal to its expected_delivery_time. This will help us assess overall tracking precision.

-- select count(order_id)/(select count(*) as on_time_orders
-- from fct_orders
-- where actual_delivery_time <= expected_delivery_time)
-- from fct_orders

select ((select count(*) as on_time_orders
from fct_orders
where actual_delivery_time <= expected_delivery_time 
  and strftime('%Y-%m', order_date) = '2024-01')/count(order_id))*100
from fct_orders
WHERE strftime('%Y-%m', order_date) = '2024-01'

-- Optimised version
SELECT
  ROUND(100.0 * SUM(CASE
                     WHEN actual_delivery_time <= expected_delivery_time THEN 1
                     ELSE 0
                   END) / COUNT(*), 2) AS on_time_delivery_percentage
FROM fct_orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';
