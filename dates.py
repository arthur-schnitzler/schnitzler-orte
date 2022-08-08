from datetime import date, timedelta
import csv
import pandas as pd

# get iso dates for all days

start_date = date(1879, 1, 1)
end_date = date(1931, 10, 21)

delta = end_date - start_date   # returns timedelta

days = []
for i in range(delta.days + 1):
    day = start_date + timedelta(days=i)
    days.append(day) # adds days to list

# write csv

df = pd.DataFrame({"dates":days})
df.to_csv("dates.csv")
