-- Title: Ad Segment Performance Analysis
-- Date: 2025-07-28
-- Source: Interview Master AI
-- Difficulty: Medium
-- Link : https://www.interviewmaster.ai/chat/e10b43ea-c96e-433d-b2df-86d06642be4a
-- Company : Meta

-- Q1. How many total ad impressions did we receive from custom audience segments in October 2024?

-- join the 2 tables on audience segment id
-- filter only the customer audience segments and oct 2024
-- sum(impressions)

SELECT ad_s.segment_name, 
    SUM(impressions) as total_impressions
FROM ad_performance as ad
INNER JOIN audience_segments as ad_s
ON ad.audience_segment_id = ad_s.audience_segment_id
WHERE ad_s.segment_name LIKE 'Custom Audience%' 
  AND strftime('%Y-%m', date) = '2024-10'
GROUP BY ad_s.segment_name