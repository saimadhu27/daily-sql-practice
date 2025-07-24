-- Title: Eats Order Tracking Partner Performance Evaluation
-- Date: 2025-07-24
-- Source: Interview Master AI
-- Difficulty: Easy
-- Link : https://www.interviewmaster.ai/chat/eff20170-da1a-4810-92cd-14d5d8745b11

-- Q3. Identify the delivery partner(s) in January 2024 whose on-time delivery percentage is below 50%. 
-- Return their partner names in uppercase. We need to work with these delivery partners to improve their on-time delivery rates.

-- identify the on-time perct
-- filter for less than 50 percent

SELECT UPPER(delivery_partner_name) as name
  FROM (
  SELECT
  delivery_partner_name,
(1.0*SUM(CASE WHEN actual_delivery_time <= expected_delivery_time
  THEN 1 ELSE 0 END)/COUNT(*)) * 100 as perct
FROM fct_orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY delivery_partner_id) as sub
WHERE perct < 50
