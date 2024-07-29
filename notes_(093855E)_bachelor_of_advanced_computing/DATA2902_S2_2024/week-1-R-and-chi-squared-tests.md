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

## Chi-squared goodness of fit

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

```r
library(tidyverse)

df = tibble(
  phenotype = c("AB", "Ab", "aB", "ab"),
  y = c(128, 86, 74, 112),
  p = c(1/4, 1/4, 1/4, 1/4),
  e = sum(y) * p
)

df
```

```
  phenotype     y     p     e
  <chr>     <dbl> <dbl> <dbl>
1 AB          128  0.25   100
2 Ab           86  0.25   100
3 aB           74  0.25   100
4 ab          112  0.25   100
```

**Is the no linkage model a good fit for observed data?**

We should always try to have a sense check by plotting the data and the model.

```r
df |> ggplot() +
  aes(x = phenotype, y = y) +
  geom_col(alpha = 0.6) +
  geom_hline(yintercept = 100,
             colour = "blue",
             size = 2) +
  labs(x = "", y = "Count")
```

<img width="530" alt="image" src="https://github.com/user-attachments/assets/c593d1cc-deb8-4a02-9e1c-77de939787e6">

The no linkage model doesn't necessarily look a good fit. Now, we want to know: **Is this due to chance alone or is there a systematic deviation?**

Differences between observed counts and expected counts:

```r
df <- df |>
  mutate(d = y - e)
df
```

```
  <chr>     <dbl> <dbl> <dbl> <dbl>
1 AB          128  0.25   100    28
2 Ab           86  0.25   100   -14
3 aB           74  0.25   100   -26
4 ab          112  0.25   100    12

```

Average difference (NOT A GREAT WAY OF SUMMARISING FIT):

```r
df |>
  summarise(avg_diff = mean(d)
```

```
  avg_diff
     <dbl>
1        0
```

**Test statistic:** Because average difference don't tell us much, let's try taking the squared differences and "normalise" by dividing by the expected cell counts: 

$$\displaystyle t_0 = \sum^k_{i=1}\frac{(y_i-e_i)^2}{e_i}$$

where $k$ is the number of categories.

```r
df <- df |> mutate(
  squared_discrepency <- (y - e)^2,
  contribution = (y - e)^2/e
)

t0 <- sum(df$contribution)
t0
```

```
[1] 18
```

Now the question is: Is this sufficient evidence for $H_0$?

**Simulate:** What does the distribution of the test statistic look like when $H_0$ is true? We can answer this by simulating from the data under the assumption $H_0$ is true

```r
n <- 400
phenotype <- c("AB", "Ab", "aB", "ab")
no_link_p <- c(1, 1, 1, 1)/4
e <- n * no_link_p
set.seed(1)
sim1 <- sample(
  x = phenotype,
  size = n,
  replace = TRUE,
  prob = no_link_p
)


table(sim1)

barplot(table(sim1), main = "Simulated counts")
```

```
sim1
 ab  aB  Ab  AB 
 88 121  96  95
```

<img width="206" alt="image" src="https://github.com/user-attachments/assets/388c64d7-533f-4190-ad1f-88b6052592e6">

So, our test statistic $T=6.26$ is much smaller than the actual data $t_0=18$. So let's try to simulate this more than just once (say, 3000 simulations)

Now we know the shape of the distribution of test statistic $T$ when $H_0$ is true. Now, given that $H_0$ is true, how likely is it that we observe a test statistic $T$ as or more exterme than we calculated from our original sample?

```r
sum(sim_t_stats >= t0)/B
mean(sim_t_stats >= t0)
```

```
0.001
```

In 0.1% of samples, when the null hypothesis is true, we got a simulated sample that was "more extreme" than our original sample.

### Doing it without simulation

Yep, using a $X^2$ test.

In this example, the test statistic,

$$\displaystyle T=\sum^k_{i=1}\frac{(Y_i - e_i)^2}{e_i}~\chi^2_{k-1}$$

approximately, where $k$ is the number of groups

Let's compare this distribution to the simulated test distribution.

```r
hist(sim_t_stats, main = "", breaks = 20,
     probability = TRUE, ylim = c(0, 0.25))
curve(dchisq(x, df = 3), add = TRUE,
      col = "blue", lwd = 2)
```


<img width="371" alt="image" src="https://github.com/user-attachments/assets/a1e25991-6a81-46bb-8e72-815ce5787c82">

Pretty good fit.

**Chi-squared test degrees of freedom**

In general, the test statistic takes the form,

$$\displaystyle T=\sum^k_{i=1}\frac{(Y_i-e_i)^2}{e_i}~\chi^2_{k-1-q}\text{ (approximately)}$$

where $q$ is the number of parameters that needs to be estimated from the sample.

The approximation will only be accurate if *no expected frequency* is too small. As a rule of thumb, we require all $e_i\geq 5$. Otherwise, we need to pool adjacent categories so that the expected frequencies are always $\geq 5$

**Table for calculating test statistic manually:**


<img width="241" alt="image" src="https://github.com/user-attachments/assets/6a3baae3-6e13-4542-8210-0d03b46aba76">

where:

- $y_i$ : observed counts
- $p_{i_0}$ : hypothesised probabilities
- $e_i$ : expected counts assuming $H_0$ is true
- $t_0$ : observed test statistic
