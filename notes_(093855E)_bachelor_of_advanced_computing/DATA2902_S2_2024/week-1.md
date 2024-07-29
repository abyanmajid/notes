# Week 1 (DATA2902)

## Getting started with R

**Installing and using packages in R**

```r
install.packages("palmerpenguins")
library("palmerpenguins")
```

**Getting help about a dataset**

```r
library("palmerpenguins")
?penguins
```

**Getting a quick look at the data frame of a dataset**

```r
library("palmerpenguins")
dplyr::glimpse(penguins)
```

**Cleaning up and standardising data frames**

```r
# install.packages("janitor")
penguins_clean <- janitor::clean_names(penguins_raw)
dplyr::glimpse(penguins_clean)
```

**Visualizing missingness in a data frame**

```r
# install.packages("visdat")
visdat::vis_miss(penguins_raw)
```

**Removing rows with missing values**

```r
penguins_clean <- tidyr::drop_na(dataset, row_name, row_2_name, ...)
```

**Piping results as inputs to other functions**

```r
penguins_clean <- penguins_raw |>
  janitor::clean_names() |>
  tidyr::drop_na(sex) |>
```

**Tabulations using `janitor`**

```r
library(janitor)
penguins_clean |>
  janitor::tabyl(species, sex) |>
  janitor::adorn_totals(where = c("row", "col"))
```

****

## Chi-squared tests

**Hypothesis testing**

- $H_0$ (Null hypothesis): It is generally a "no difference" statement (usually the current state of the world)
- $H_1$ (Alternative hypothesis): It is often a "not $H_0$" (maybe the world behaves differently than what we used to think)

**Assumptions**

- Observations are generally assumed to have been chosen at random from a population. So they are *iid* (independently and identically distributed)
- Each test we consider will have its own sets of assumptions.

**Test statistic**

- Since observations vary from sample to sample, we can never be sure whether $H_0$ is true or not.
- A test statistic is a function of the observations, $T=f(X_1,...,X_n)$, such that the dsitribution of $T$ is known assuming, assuming $H_0$ is true. It can be used to test if the data are consistent with $H_0$.
- The **observed test statistic**, $t_0$, is where we plug our observed data into the formula for the test statistic.
- Large (positive or negative depending on $H_1$) observed test statistic values is taken as evidence of poor agreement with $H_0$.

**Significance**

The $p$-value is the probability of getting a test statistic $T$ as or more extreme than the value observed $t_0$ (assuming $H_0$ is true)

**Decision**

- If the $p$-value is small, then the stronger the evidence against the null hypothesis.
- A large $p$-value does not mean there is evidence that the null hypothesis is true, but rather that it suggests consistency with the null hypothesis.
- The level of significance $\alpha$ is the strength of evidence needed to reject $H_0$ (often $\alpha=0.05$)

**Example with Genetic Linkage**

Model: No linkage

Hypotheses:
- $H_0$: Each of the phenotypes are equally likely
- $H_1$: The phenotypes are NOT equally likely

Let $p_i$ be the probability of being in the $i$-th phenotype $i=\{AB,Ab,aB,ab\}$.

Under $H_0$ (i.e., assuming that the no linkage model is correct) the counts are uniformly distributed across the 4 categories,

$$p_i=0.25\text{ for all }i$$
