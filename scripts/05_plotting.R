library(survival)
library(surv)
library(broom)
library(ggplot2)

df = read.csv('data/cleaned-data.csv')

cox_model=coxph(Surv(time_to_event, event) ~ treatment + age + sex, data = df)
fit=survfit(Surv(time_to_event, event) ~ treatment, data = df)

plot(
  fit,
  col = c("black", "red"),
  lty = 1:2,
  xlab = "Time",
  ylab = "Survival probability",
  main = "Kaplan–Meier Survival by Treatment"
)

km_tidy = broom::tidy(fit)


ggplot(km_tidy, aes(x = time, y = estimate, color = strata)) +
  geom_step() +
  labs(
    x = "Time",
    y = "Survival probability",
    title = "Kaplan–Meier Survival by Treatment",
    color = "Treatment"
  )
ggsave("outputs/km_plot_ggplot.png", width = 8, height = 6, dpi = 300)


# actg 175 data

df_ac = read.csv("data/actg175.csv")


# Box plot``
png("outputs/actg_delta_boxplot-.png")

boxplot(delta ~ treatment, data = df_ac,
        main = "Change in CD4 Count by Treatment",
        ylab = "Delta (CD4 change)",
        xlab = "Treatment Group")
dev.off()

# Scatter plot
png("outputs/actg_cd4_scatter.png", width = 800, height = 600)

plot(df_ac$baseline_score, df$followup_score,
     pch = 19, col = ifelse(df$treatment == "Treatment", "#1f78b4", "#33a02c"),
     xlab = "Baseline CD4",
     ylab = "Follow-up CD4 (Week 20)",
     main = "Baseline vs Follow-up CD4 by Treatment")

legend("topleft",
       legend = c("Control", "Treatment"),
       col = c("#33a02c", "#1f78b4"), pch = 19)

dev.off()

# Paired Plot

cd4_mat=cbind(df_ac$baseline_score, df$followup_score)

png("outputs/actg_cd4_paired.png", width = 800, height = 600)

matplot(t(cd4_mat), type = "l", lty = 1, col = rgb(0, 0, 0, 0.05),
        xaxt = "n", xlab = "", ylab = "CD4 Count",
        main = "Baseline vs Follow-up CD4 (Paired Lines)")

axis(1, at = c(1, 2), labels = c("Baseline", "Week 20"))

dev.off()
