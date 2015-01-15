import pandas

def lowest(df, percent=0.1, col='total_score'):
    return df[(df[col] < df[col].quantile(percent))]

sf = pandas.read_csv('score.sc', delimiter=r'\s+')
sf['scaffold'] = sf['description'].str[0:4]
sf.groupby('scaffold').apply(lowest).to_csv('lowest.csv')
