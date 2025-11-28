library(tableone)
df = read.csv('data/actg175.csv')
vars = c("age", "sex", "baseline_score", "risk_group", "stratum")
factorVars = c("sex", "risk_group", "stratum")


tab = CreateTableOne(vars = vars,
                      strata = "treatment",
                      data = df,
                      factorVars = factorVars)
baseline_table = print(tab, quote = FALSE, noSpaces = TRUE)
baseline_table

write.csv(baseline_table,"data/actg_baseline_btl.csv", row.names = FALSE)
