# E-commerce Sales Analysis
# Practice Data Analyst Project
# Dataset: ecommerce_sales.csv

import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("ecommerce_sales.csv")
df["order_date"] = pd.to_datetime(df["order_date"])

# 1. Basic inspection
print(df.head())
print(df.info())
print(df.isnull().sum())

# 2. Overall KPIs
print("Total Sales:", round(df["sales"].sum(), 2))
print("Total Profit:", round(df["profit"].sum(), 2))
print("Units Sold:", df["quantity"].sum())
print("Average Order Value:", round(df["sales"].mean(), 2))

# 3. Category performance
category_summary = (
    df.groupby("category")[["sales", "profit", "quantity"]]
      .sum()
      .sort_values("sales", ascending=False)
)
print(category_summary)

category_summary["sales"].plot(kind="bar", title="Sales by Category")
plt.ylabel("Sales")
plt.tight_layout()
plt.show()

# 4. Regional performance
region_summary = (
    df.groupby("region")[["sales", "profit"]]
      .sum()
      .sort_values("sales", ascending=False)
)
print(region_summary)

# 5. Monthly trend
monthly = (
    df.set_index("order_date")
      .resample("ME")[["sales", "profit"]]
      .sum()
)
print(monthly)

monthly["sales"].plot(kind="line", marker="o", title="Monthly Sales Trend")
plt.ylabel("Sales")
plt.tight_layout()
plt.show()

# 6. Top products
top_products = (
    df.groupby("product")[["sales", "profit", "quantity"]]
      .sum()
      .sort_values("sales", ascending=False)
      .head(10)
)
print(top_products)

# 7. Channel analysis
channel = df.groupby("sales_channel")[["sales", "profit"]].sum()
print(channel)

# 8. Profit margin
profit_margin = df["profit"].sum() / df["sales"].sum() * 100
print("Overall Profit Margin:", round(profit_margin, 2), "%")
