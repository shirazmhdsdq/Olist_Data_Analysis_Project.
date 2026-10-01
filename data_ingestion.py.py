import pandas as pd
from sqlalchemy import create_engine

# 1. Update your password
engine = create_engine("mysql+pymysql://root:YourNewPassword123@localhost/olist_ecommerce")

print("Loading Orders...")
# 2. Paste the exact folder path you used earlier, but end it with \olist_orders_dataset.csv
orders_df = pd.read_csv(r"C:\Users\azam\Downloads\archive\olist_orders_dataset.csv")

# 3. This will replace the empty table with the fully populated one
orders_df.to_sql(name='olist_orders', con=engine, if_exists='replace', index=False)

print("Success! Orders table is fully loaded.")