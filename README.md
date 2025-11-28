# Clinical Trial Statistical Analysis (Simulated Data)

This project explores the workflow of analyzing a simulated clinical trial dataset from beginning to end.

The purpose was to understand how baseline characteristics, treatment assignment, and clinical outcomes behave across a study population. I wanted to see how much information a simple simulated dataset could reveal when processed through standard statistical procedures such as baseline summaries, logistic regression, and survival analysis.

What I observed was that both treatment arms behaved very similarly. The survival curves were close to overlapping, the logistic regression model showed no strong predictors, and the Cox model did not identify meaningful differences. This was expected because the dataset was random, but it was useful to see how the full workflow behaves with neutral data.

Next, I plan to expand the dataset with additional clinical variables, explore more subgroup analyses, and generate more TFL style summaries that resemble real clinical reporting.

## Key Outputs

### 1. Kaplan Meier Survival Curve
Survival probability over time for the two treatment groups.
![Plot](outputs/km_plot_ggplot.png)

### 2. Baseline Characteristics Table
Baseline demographic and clinical characteristics stratified by treatment.
* *Continuous variables are reported as mean (SD).*
* *Categorical variables are reported as n (%).*

**File:** `outputs/baseline_btl.csv`

### Baseline Characteristics Table

| Characteristic                     | Drug           | Placebo        | p_value |
|------------------------------------|----------------|----------------|---------|
| n                                  | 149            | 151            |         |
| age (mean (SD))                    | 54.54 (9.92)   | 54.99 (9.88)   | 0.694   |
| sex = M (%)                        | 75 (50.3)      | 73 (48.3)      | 0.819   |
| baseline_score (mean (SD))         | 49.64 (9.97)   | 49.05 (9.47)   | 0.599   |
| risk_group = 1 (%)                 | 43 (28.9)      | 43 (28.5)      | 1.000   |
| site_id (%)                        |                |                | 0.057   |
| &nbsp;&nbsp;1                      | 36 (24.2)      | 26 (17.2)      |         |
| &nbsp;&nbsp;2                      | 26 (17.4)      | 36 (23.8)      |         |
| &nbsp;&nbsp;3                      | 29 (19.5)      | 31 (20.5)      |         |
| &nbsp;&nbsp;4                      | 20 (13.4)      | 33 (21.9)      |         |
| &nbsp;&nbsp;5                      | 38 (25.5)      | 25 (16.6)      |         |
### 3. Model Results
**Full outputs saved in:** `outputs/model_results.txt`

The file contains the summaries for:
* Logistic regression
* Cox proportional hazards model
* Odds ratios
* Hazard ratios
* Confidence intervals
* Model level statistics

---

## Project Purpose and Findings

### Purpose
* Simulate a small clinical trial dataset.
* Derive simple clinical variables.
* Apply logistic regression and survival analysis.
* Generate summary tables and figures.
* Observe how treatment groups differ at baseline and over time.

### What I observed
* Treatment arms looked similar in all analyses.
* No large differences in survival curves.
* No strong predictors in logistic regression.
* Weak and non-significant effects in the Cox model.
* Baseline characteristics were well balanced.

### What this suggests
The simulated dataset behaved like a neutral study with no major treatment effect. This is helpful for learning the workflow without being influenced by dramatic or unrealistic outcomes.

### Next steps
* Add laboratory and vital sign variables.
* Introduce more realistic event patterns.
* Create more TFL style tables.
* Analyze additional stratified subgroups.
* Expand the number of endpoints.

---

## Project Structure

```text
clinical_trial_stat/
│
├── data/
│   └── clinical_trial.csv
│
├── scripts/
│   ├── 01_data_generation.R
│   ├── 02_data_cleaning.R
│   ├── 03_analysis.R
│   └── 04_tfl_generation.R
│
├── outputs/
│   ├── baseline_characteristics.csv
│   ├── km_plot.png
│   └── model_results.txt
│
├── clinical_trial_stat.Rproj
└── README.md
```

## Data and Methods
### Data
The dataset includes:

- Demographic variables

- Treatment assignment

- Baseline and follow up scores

- Binary response outcome

- Time to event outcome

- Derived fields: delta (change from baseline) and risk_group (age greater than 60)

Methods
- Baseline characteristics summary

- Logistic regression for binary outcomes

- Kaplan Meier estimation

- Cox proportional hazards regression

## Reproducibility
### Run the analysis pipeline:
```
Rscript scripts/01_data_generation.R
Rscript scripts/02_data_cleaning.R
Rscript scripts/03_analysis.R
Rscript scripts/04_tfl_generation.R
```
All outputs will be created in the outputs directory.


---
