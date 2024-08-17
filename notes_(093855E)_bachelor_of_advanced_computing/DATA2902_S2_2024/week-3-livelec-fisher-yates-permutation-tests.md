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





