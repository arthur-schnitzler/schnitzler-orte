import pandas as pd
from dateutil import parser
import datetime

#  write each day into a single row

SCHNITZLER_ORTE_CSV = "./finalized-files/places_with_pmb_and_akon.csv"

def get_days(start_date, end_date):
    delta = parser.parse(end_date) - parser.parse(start_date)
    return delta.days + 1

df = pd.read_csv(SCHNITZLER_ORTE_CSV)

df['days'] = df.apply(lambda row : get_days(row['_from'], row['_to']), axis = 1)

rows = []
for i, row in df.iterrows():
    if row['days'] < 300:
        for x in range(row['days']):
            if x > 0:
                cur_day = str(parser.parse(row['_from']) + datetime.timedelta(days=x)).split()[0]
            else:
                cur_day = row['_from']
            item = dict(row)
            item['cur_day'] = cur_day
            for p in ['Unnamed: 0', 'desc/placeName/_ref']:
                item.pop(p, None)
            rows.append(item)

new_df = pd.DataFrame(rows)
new_df.to_csv('tmp.csv', index=False)