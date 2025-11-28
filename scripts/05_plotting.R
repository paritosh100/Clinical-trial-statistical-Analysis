library(survival)
library(surv)
library(broom)
library(ggplot2)

df = read.csv('data/cleaned-data.csv')

cox_model <- coxph(Surv(time_to_event, event) ~ treatment + age + sex, data = df)
fit <- survfit(Surv(time_to_event, event) ~ treatment, data = df)

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
