# Title: Python Party Day 2: Sponsored Posts Click Performance
# Date: 2025-08-07
# Source: Interview Master AI
# Difficulty: Medium
# Link : https://www.interviewmaster.ai/chat/c6d08f35-a8c0-4566-a277-6d0118f39286
# Company : Amazon

# Q3. For the product categories identified in the previous question, what is the percentage difference between 
# their CTR and the overall average CTR for October 2024? This analysis will quantify the performance gap to recommend 
# specific categories for targeted advertising optimization.
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
categories = ctr_per_product[ctr_per_product['avg_ctr_product']>avg_ctr]
categories['pct_diff'] = ((categories['avg_ctr_product'] - avg_ctr)/avg_ctr)*100
categories[['product_category', 'pct_diff']]
