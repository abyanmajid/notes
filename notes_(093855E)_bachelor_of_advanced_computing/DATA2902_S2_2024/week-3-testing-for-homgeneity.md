# Week 3 PRE-REC DATA2902 (Testing for Homogeneity)

**Test of homogeneity**

Suppose that observations are sampled from 2 independent populations, each of which is categorised accoridng to the same set of outcomes. We want to test whether the distribution (proportions) of the outcomes are the same across the different populations.

EXAMPLE: In a COVID-19 treatment case, we will consider the proportions of patients treated with plasma who died or were discharged AND, SEPARATELY, the proportion of patients who were NOT treated with plasma who died or were discharged.

<img width="409" alt="image" src="https://github.com/user-attachments/assets/a38e2b3a-ead6-4f48-87d7-d63297b35d89">

**Two-way contingency table**

A contingency table allows us to tabulate data from multiple categorical variables. Below's an example:

<img width="207" alt="image" src="https://github.com/user-attachments/assets/7e1a1f93-5312-4aea-9bf0-064459e17b98">

To make a contingency table in R, do:

```r
library(tidyverse)
dat = read_csv("path to csv")
dat = dat |>
  filter(outcome != "Censored") |>
  mutate(treatment = factor(treatment, levels = c("Plasma", "No plasma")),
  outcome = factor(outcome, levels = c("Died", "Discharged")))

table(dat$treatment, dat$outcome)
dat |> janitor::tabyl(treatment, outcome) |>
  gt::gt()
```

**Notation for contingency tables**

<img width="435" alt="image" src="https://github.com/user-attachments/assets/f33be768-6929-45d1-b7bc-5b0a48e3f21c">

$$e_{ij}=\frac{\text{Row } i\text{ Total}\times\text{Column }
j\text{ total}}{\text{Overall total}}$$

**Workflow for Chi-squared test of homogeneity**

<img width="427" alt="image" src="https://github.com/user-attachments/assets/671d9758-0ede-4dde-8c64-d14135f29c61">

**Example test of homogeneity:**

<img width="446" alt="image" src="https://github.com/user-attachments/assets/46f18582-2ee3-44c0-bda7-0af2ca0f9986">

or, done using R:

```r
tab = table(dat$treatment, dat$outcome)
chisq.test(tab, correct = F)
```

**Degrees of freedom:**

For a $r\times c$ table, the degrees of freedom (df) is $(r-1)(c-1)$

**Doing a test of homogeneity in R**

```r
y = c(62, 47, 29, 46, 9, 7)
n = sum(y)
c = 3
r = 2
tab = matrix(y, nrow = r, ncol = c)
colnames(tab) = c("Approve",
                  "Not approve",
                  "No comment")
rownames(tab) = c("Labor", "Liberal")
chisq.test(tab, correct = F)
```

