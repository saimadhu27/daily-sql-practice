-- Title: Eats Order Tracking Partner Performance Evaluation
-- Date: 2025-07-24
-- Source: Interview Master AI
-- Difficulty: Easy
-- Link : https://www.interviewmaster.ai/chat/eff20170-da1a-4810-92cd-14d5d8745b11

-- Q2. List the top 5 delivery partners in January 2024 ranked by the highest percentage of on-time deliveries. 
-- Use the delivery_partner_name field from the records. This will help us identify which partners perform best.

 -- first find the on-time percentage for each partner
select 
  delivery_partner_name,
  (sum(case when actual_delivery_time<=expected_delivery_time 
  THEN 1 ELSE 0 END)/count(*)) * 100.0 as perct
FROM fct_orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY delivery_partner_id
ORDER BY perct DESC
LIMIT 5;