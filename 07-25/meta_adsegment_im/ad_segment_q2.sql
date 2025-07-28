-- Title: Ad Segment Performance Analysis
-- Date: 2025-07-28
-- Source: Interview Master AI
-- Difficulty: Medium
-- Link : https://www.interviewmaster.ai/chat/e10b43ea-c96e-433d-b2df-86d06642be4a
-- Company : Meta

-- Q2. What is the total number of conversions we achieved from each custom audience segment in October 2024?

SELECT ad_s.segment_name, 
    SUM(conversions) as total_conversions
FROM ad_performance as ad
INNER JOIN audience_segments as ad_s
ON ad.audience_segment_id = ad_s.audience_segment_id
WHERE ad_s.segment_name LIKE 'Custom Audience%'
   AND strftime('%Y-%m', date) = '2024-10'
GROUP BY ad_s.segment_name;