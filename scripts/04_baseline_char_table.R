library(tableone)

vars = c("age", "sex", "baseline_score", "risk_group", "site_id")
factorVars = c("sex", "risk_group", "site_id")


tab = CreateTableOne(vars = vars,
                      strata = "treatment",
                      data = df,
                      factorVars = factorVars)
baseline_table = print(tab, quote = FALSE, noSpaces = TRUE)
baseline_table

write.csv(baseline_table,"data/baseline_btl.csv", row.names = FALSE)
