# Week 6 DATA2902 (Permutation Tests)

For Fisher's experiment, we were left with 2 categorical variables:

- **Truth:** Milk, Tea, Tea, Milk, Tea, Tea, Milk, Milk
- **Prediction:** Milk, Tea, Tea, Milk, Tea, Tea, Milk, Milk

Are the predictions independent of the truth?

- $H_0:$ Lady cannot taste the difference
- $H_0:$ Lady can taste the difference

Our test statistic $T$ is the no. of tea before milk cups correctly identified.

### Permutations

We can consider all 40,320 different permutations of 8 cups of tea

```r
library(arrangements)

truth = c("milk","tea","tea","milk","tea","tea","milk","milk")
permute_guess = permutations(truth)
permute_guess[92, ]
```

We can check if a particular permuted sequence fo tea cups is identical to the true sqeuence

```
# is the 92nd sequence true?
identical(permute_guess[92, ], truth)
```

**Exact p-value:**

```r
B = nrow(permute_guess)

check_correct = vector("numeric", length = B)
for(i in 1:B) {
 check_correct[i] = identical(permute_guess[i,], truth)
}

c(sum(check_correct), mean(check_correct))
```

```
>> 0.0143
```

This is the same p-value as we get using Fisher's exact test!

```r
truth = c("milk", "tea", "tea", "milk", "tea", "tea", "milk", "milk")
predicted = c("milk", "tea", "tea", "milk", "tea", "tea", "milk", "milk")
tea_mat = table(truth, predicted)
fisher.test(tea_mat, alternative = "greater")$p.value
```

```
>> 0.0143
```

**Approximate p-value**

Having all $n!$ permutations is often not feasible as it is computationally expensive. So we can instead use `sample()` to have a smaller selection:

```r
set.seed(123)

truth = c("milk","tea","tea","milk","tea","tea","milk","milk")

B = 10000
result = vector(length = B) # initialise outside the loop

for(i in 1:B){
 guess = sample(truth, size = 8, replace = FALSE) # does the permutation
 result[i] = identical(guess, truth)
}

mean(result)
```

```r
data.frame(abs_t_null = abs(t_null)) |>
 ggplot() +
 aes(x = abs_t_null) +
 geom_histogram(binwidth = 0.1,
 boundary = 0) +
 geom_vline(
 xintercept = abs(tt$statistic), 
 col = "red", lwd = 2) +
 labs(
 x = "Absolute value of test statistic"
 )
```

```r
mean(abs(t_null) >= abs(tt$statistic))
```




