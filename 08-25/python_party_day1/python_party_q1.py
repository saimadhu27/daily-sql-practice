# Title: Python Party Day 1: WhatsApp Group Size Engagement Analysis
# Date: 2025-08-06
# Source: Interview Master AI
# Difficulty: Easy
# Link : https://www.interviewmaster.ai/chat/f735ca3a-6d43-4fd8-aa9b-245954f8e779
# Company : WhatsApp

# Q1. What is the maximum number of participants among WhatsApp groups that were created in October 2024? 
# This metric will help us understand the largest group size available.
# Tables
# dim_groups(group_id, created_date, participant_count, total_messages)

# Note: pandas and numpy are already imported as pd and np
# The following tables are loaded as pandas DataFrames with the same names: dim_groups
# Please print your final result or dataframe

oct = dim_groups[(dim_groups['created_date'].dt.year == 2024) &
  (dim_groups['created_date'].dt.month == 10)]
oct.sort_values(by='participant_count',
                           ascending = False).reset_index()['participant_count'][0]