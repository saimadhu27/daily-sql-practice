# Title: Python Party Day 2: Sponsored Posts Click Performance
# Date: 2025-08-07
# Source: Interview Master AI
# Difficulty: Medium
# Link : https://www.interviewmaster.ai/chat/c6d08f35-a8c0-4566-a277-6d0118f39286
# Company : Amazon

# Q1. What is the average click-through rate (CTR) for sponsored product ads for each product category 
# that contains the substring 'Electronics' in its name during October 2024? 
# This analysis will help determine which electronics-related categories are performing optimally.
#Tables

#fct_ad_performance(ad_id, product_id, clicks, impressions, recorded_date)
#dim_product(product_id, product_category, product_name)

# Note: pandas and numpy are already imported as pd and np
# The following tables are loaded as pandas DataFrames with the same names: dim_groups
# Please print your final result or dataframe

df = pd.merge(fct_ad_performance, dim_product,
        on='product_id', how='inner')
df = df[(df['product_category'].str.contains('Electronics'))&
  (df['recorded_date'].dt.year == 2024) & 
  (df['recorded_date'].dt.month == 10)]
df['CTR'] = df['clicks']/df['impressions']*100
df.groupby('product_category')['CTR'].mean()