#HEALTHCARE Diabetes Risk Analysis
#AUTHOR: HIMANSHU PAL

import pandas as pd
df=pd.read_csv('Healthcare.csv')
df.head()
df.shape
df.size
df.columns
df.describe()
df['Diabetes_Status'].value_counts() # Total diabetic and Non-diabetic patients
df.groupby('Diabetes_Status')['Glucose'].mean() #Average glucose by status
df[(df['Glucose'] > 140) & (df['BMI'] > 30)] #High risk patients
df['Risk_Level']=df['Glucose'].apply( #To categorize patient according to the risk
    lambda x: 'High Risk' if x>160
    else 'Moderate Risk' if x>=120
    else 'Low Risk'
)
df[['Glucose','Risk_Level']].head()
df.groupby(['Risk_Level','Diabetes_Status']).size().unstack() #Gives the result which patients require immidiate attention
risk_table=df.groupby(['Risk_Level','Outcome']).size().unstack()
risk_table

