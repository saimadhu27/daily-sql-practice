-- Title: Ad Segment Performance Analysis
-- Date: 2025-07-28
-- Source: Interview Master AI
-- Difficulty: Medium
-- Link : https://www.interviewmaster.ai/chat/e10b43ea-c96e-433d-b2df-86d06642be4a
-- Company : Meta

-- Q3. For each custom audience or lookalike segment, calculate the cost per conversion. 
-- Only return this for segments that had non-zero spend and non-zero conversions. 
-- Cost per conversion = Total ad spend / Total number of conversions

 SELECT segment_name, 
   SUM(ad_spend)/SUM(conversions) as cost_per_conversion
FROM ad_performance as ad
INNER JOIN audience_segments as ad_s
ON ad.audience_segment_id = ad_s.audience_segment_id
WHERE (ad_s.segment_name LIKE 'Lookalike Audience%'
   OR ad_s.segment_name LIKE 'Custom Audience%')
  AND ad_spend > 0 AND conversions > 0
GROUP BY ad_s.segment_name