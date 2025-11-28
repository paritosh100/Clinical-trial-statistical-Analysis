df = read.csv('data/clinical_trial.csv')

df$age = round(df$age)
df$baseline_score = round(df$baseline_score)
df$followup_score = round(df$followup_score)

df$delta = (df$delta = df$followup_score - df$baseline_score)

df$risk_group = ifelse(df$age > 60 , 1, 0)




View(df)
write.csv(df, 'data/cleaned-data.csv',row.names = FALSE)
