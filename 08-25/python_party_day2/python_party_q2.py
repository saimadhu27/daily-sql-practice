# Title: Python Party Day 2: Sponsored Posts Click Performance
# Date: 2025-08-07
# Source: Interview Master AI
# Difficulty: Medium
# Link : https://www.interviewmaster.ai/chat/c6d08f35-a8c0-4566-a277-6d0118f39286
# Company : Amazon

# Q2. Which product categories have a CTR greater than the aggregated overall average CTR for sponsored product 
# ads during October 2024? This analysis will identify high-performing categories for further optimization. 
# For this question, we want to calculate CTR for each ad, then get the average across ads by product category & overall.
#Tables

#fct_ad_performance(ad_id, product_id, clicks, impressions, recorded_date)
#dim_product(product_id, product_category, product_name)

# Note: pandas and numpy are already imported as pd and np
# The following tables are loaded as pandas DataFrames with the same names: dim_groups
# Please print your final result or dataframe

df = pd.merge(fct_ad_performance, dim_product,
        on='product_id', how='inner')
df = df[(df['recorded_date'].dt.year == 2024) & 
  (df['recorded_date'].dt.month == 10)]
df['CTR'] = df['clicks']/df['impressions']*100
ctr_per_product = df.groupby('product_category')['CTR'].mean().to_frame(name='avg_ctr_product').reset_index()
avg_ctr = df['CTR'].mean()
ctr_per_product[ctr_per_product['avg_ctr_product']>avg_ctr]['product_category']