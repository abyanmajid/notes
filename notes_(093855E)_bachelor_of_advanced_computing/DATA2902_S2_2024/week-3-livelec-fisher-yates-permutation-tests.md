# Week 3 LIVELEC DATA2902

## Fisher's exact test

For Fisher's experiment we have two categorial variables `Truth` and `Prediction`, as well as the hypothesis: "Are the predictions independent of the truth?"

_Using chi-square?:_ We can use approximate the test statistic using Chi-square, but it's only reasonable when $n$ is sufficiently large i.e., expected cell freq. need to all be >= 5. Otherwise, we may want to consider EXACT tests instead (i.e., calculating the exact $p$-value for the test statistic)

_Assumption:_ We should assume that we have independent observations.

**Formulating the hypotheses:**

Let $\theta$ be the odds ratio ($OR$).

RECALL: If $A$ and $B$ are independent, then $OR=1$

For fisher's exact test, we have:

- $H_0 : \theta = 1$
- $H_1 : \theta > 1$ or $H_1 : \theta < 1$ or $H_1 : \theta \neq 1$

The test is based on the observed value of the top left cell, i.e., $y_{11}$

<img width="145" alt="image" src="https://github.com/user-attachments/assets/368625e8-f87f-4cf0-a647-539ed48cfd83">

**Aside: Hypergeometric Distribution**

<img width="388" alt="image" src="https://github.com/user-attachments/assets/c77f2997-c7f4-493a-95bb-3bfbaa4f6421">

**Hypergeometric distribution for Fisher's exact test**

<img width="418" alt="image" src="https://github.com/user-attachments/assets/00495960-510e-4d94-813c-7118795636d1">

**p-values**

To calculate the $p$-value for a table, we need to:

1. Enumerate all tables as extreme, or more extreme than the observed table with the same marginal totals
2. Sum up the probability of each of these tables.

**How do we define "more extreme"?**

<img width="214" alt="image" src="https://github.com/user-attachments/assets/e303f176-7f1f-43d5-9e80-e62cfdffd74e">

<img width="422" alt="image" src="https://github.com/user-attachments/assets/55330a06-6c07-4f84-8571-767fe14ac690">

in R:

```r
truth = c("milk", "tea", "tea", "milk", "tea", "tea", "milk", "milk")
predicted = c("milk", "tea", "tea", "milk", "tea", "tea", "milk", "milk")
tea_mat = table(truth, predicted)
tea_mat

fisher.test(tea_mat, alternative = "greater")
```

**Drawbacks**

Reasons why we don't use fisher's exact test all the time:

- The calculation of the $p$-value requires conditioning on row and column margins being fixed
- Computationally difficult for large samples
- It can be genralized to $r\times c$ two-way contingency tables but is very difficult to compute; generally requires use of Monte Carlo (i.e., random permutation)

## Yates' Corrected $\chi^2$ Test

Yates modified the standard chi-squared test with a continuity correction - and its usually more accurate when counts in each cell are small.

Yates' statistic for $2\times 2$ tables is

<img width="179" alt="image" src="https://github.com/user-attachments/assets/1eab2204-7236-429f-ba2b-4e433a731189">

which approximately follows a $\chi^2_1$ distribution under $H_0$

**Continuity correction**

In general, if we have an integer-valued random variable $X$ which we would like to approximate with a continuous random variable $Y$ then

$$P(X\leq x)\approx P(Y\leq x + 0.5)\text{ and }P(X\geq x)\approx P(Y\geq x - 0.5)$$

**Yates' continuity correction in R**

It's just using `chisq.test`, but with `correct = TRUE` as opposed to it being `FALSE` as in traditional chi-squared tests

```r
chisq.test(tea_mat, correct = TRUE)
```

## Permutation testing

**Monte Carlo Simulation**

The Monte Carlo simulation procedure is as follows:

1. Analyse the sample as one would normally do in a hypothesis test (up to, and including, the calc. of the test statistic)
2. From the original sample being analysed, resample it LOTS of times
3. The test statistic of interest is calc. for each of the resamples
4. These LOTS of test statistics will then be used to calculate p-values for the observed statistic.

**Monte Carlo p-values**

Monte Carlo $p$-values ay be obtained by randomly generating contingency tables given that the margins are assumed fixed (we can use `r2dtable()`, which generates a list of random 2-way tables given marginals)

```r
galton.dat <- matrix(c(5, 4, 1, 12, 42, 14, 2, 15, 10), 3, 3)
rownames(galton.dat) = c("Arches-B", "Loops-B", "Whorls-B")
colnames(galton.dat) = c("Arches-A", "Loops-A", "Whorls-A")

row_totals = rowSums(galton.dat)
col_totals = colSums(galton.dat)
B = 10000
set.seed(123)
x_list = r2dtable(n = B, 
                r = row_totals,
                c = col_totals)

rnd.chisq = numeric(B) # initialise an empty vector
for (i in 1:B){ # loop over B iterations
  # each time save the test statistic
  rnd.chisq[i] = chisq.test(x_list[[i]])$statistic
}
# what proportion of times did we observe a test statistic
# as or more extreme than what we observed?
sum(rnd.chisq >= 11.1699)/B
```

You can alterantively use `chisq.test` to compute Monte Carlo p-values, which internally also uses `r2dtable()`

```
chisq.test(galdon.dat, simulate.p.value = TRUE, B = 10000)
```

`B = 10000` specifies 10000 resamples.





