-- Title: Users By Average Session Times
-- Date: 2025-07-25
-- Source: Stratascratch
-- Difficulty: Medium
-- Link : https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3

-- Q. Calculate each user's average session time, where a session is defined as the time difference 
-- between a page_load and a page_exit. Assume each user has only one session per day. 
-- If there are multiple page_load or page_exit events on the same day, use only the 
-- latest page_load and the earliest page_exit, ensuring the page_load occurs before the page_exit. 
-- Output the user_id and their average session time.


-- first need to find the session time for each day for each user
-- then avg those session times for each user.
-- select max(case when action = page_load then page_load end) - min(case when action = page_exit then page_load end) 
-- from facebook_web_log
-- group by day(timestamp), user


WITH session_times AS (
  SELECT 
    user_id,
    DATE(timestamp) AS session_date,
    MAX(CASE WHEN action = 'page_load' THEN timestamp END) AS load_time,
    MIN(CASE WHEN action = 'page_exit' THEN timestamp END) AS exit_time
  FROM facebook_web_log
  GROUP BY user_id, DATE(timestamp)
),
valid_sessions AS (
  SELECT 
    user_id,
    TIMESTAMPDIFF(SECOND, load_time, exit_time) AS session_duration
  FROM session_times
  WHERE load_time < exit_time
)
SELECT 
  user_id,
  ROUND(AVG(session_duration), 2) AS avg_session_time_seconds
FROM valid_sessions
GROUP BY user_id;
