library(survival)
library(survimer)

df = read.csv('data/cleaned-data.csv')
View(df)


model = glm(response ~  treatment + age + sex,df, family= 'binomial')
summary(model)


cox_model = coxph(Surv(time_to_event, event) ~ treatment + age + sex, df)
summary(cox_model)
