library(survival)
library(survimer)
library(speff2trial)
data("ACTG175")

df = read.csv('data/actg175.csv')

model = glm(response ~  treatment + age + sex,df, family= 'binomial')
summary(model)

exp(cbind(OR = coef(model), confint(model)))
or_table <- exp(cbind(OR = coef(model), confint(model)))
write.csv(or_table, "outputs/actg_odds_ratios.csv")
