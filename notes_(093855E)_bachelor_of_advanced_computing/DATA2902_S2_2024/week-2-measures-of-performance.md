# Week 2 pre-recorded lecture PR04 (DATA2902)

**Breast Cancer Case Study:**

- **True positive (TP):** Mammogram returns a positive test result and you actually have breast cancer
- **False negative (FN):** Mammogram returns a negative test result but you do actually have breast cancer
- **False positive (FP):** Mammogram returns a positive test result but you don't actually have breast cancer
- **True negative (TN):** Mammogram returns a negative test result and you don't actually have breast cancer

More notation:

- $D^+$ : individual has a particular disease. The prevalence is the marginal probability of disease, $P(D^+)$
- $D^-$ : individual does NOT have a particular disease.
- $S^+$ : a positive screening test result or a symptom being present.
- $S^-$ : a negative screening test result or no symptom. 

<img width="350" alt="image" src="https://github.com/user-attachments/assets/5edbf55d-45d7-4633-8740-d327302177f5">

<img width="400" alt="image" src="https://github.com/user-attachments/assets/aec38fb3-36bb-468a-977f-2d45fbadb768">

**Accuracy:** The probability that the test is correct,

$$\displaystyle\frac{a+d}{a+b+c+d}$$

**Misclassification rate:** The probability that the test is incorrect,

$$\displaystyle\frac{b+c}{a+b+c+d}$$

**False negative (FN) rate:** The probability the test is negative, given the subject actually has the disease

$$\displaystyle P(S^-|D^+)=\frac{c}{a+c}$$

**True positive (TP) rate / Sensitivity / Recall:** The probability the test is positive, given the subject actually has the disease

$$P(S^+|D^+)=\frac{a}{a+c}$$

**False positive (FP) rate:** The probability the test is positive, given the subject does NOT have the disease

$$P(S^+|D^-)=\frac{b}{b+d}$$

**True negative (TN) rate / Specificity:** The probability the test is negative, given the subject does NOT have the disease

$$P(S^-|D^-)=\frac{d}{b+d}$$

**Positive predictive value / Precision:** The probability the subject has the disease, given the test is positive

$$P(D^+|S^+)=\frac{a}{a+b}$$

**Negative predictive value:** The probability the subject does NOT have the disease, given the test is negative,

$$P(D^-|S^-)=\frac{d}{c+d}$$

## Conditional Probability

**Definition of Conditional Probability:**

Let $B$ be an event so that $P(B)>0$

The conditional probability of an event $A$ given that $B$ has ocurred is

$$P(A|B)=\frac{P(A\cap B)}{P(B)}$$

<img width="129" alt="image" src="https://github.com/user-attachments/assets/bef8e593-e0de-42e1-a35b-c2616121fc01">

Rearranging, we also have

$$P(A\cap B)=P(A|B)P(B)$$

$$P(A\cap B)=P(B|A)P(A)$$

**Bayes' rule**

$$P(B|A)=\frac{P(A|B)P(B)}{P(A|B)P(B)+P(A|B^c)P(B^c)}$$

Example:

<img width="620" alt="image" src="https://github.com/user-attachments/assets/74134a32-52fe-4a97-9db2-ccf2827f2033">

**Evaluating a classification model in R**

```r
# install.packages("rpart")
data(kyphosis, package = "rpart")
dplyr::glimpse(kyphosis)
```

```r
kyphosis = kyphosis |>
  dplyr::mutate(
    prediction = if_else(Start >= 9,
                         "Predict absent",
                         "Predict present")
  )
table(kyphosis$prediction, kyphosis$Kyphosis)
```

```r
conf_mat = kyphosis |>
  dplyr::mutate(
    prediction = if_else(Start >= 9,
                         "absent",
                         "present"),
    Kyphosis = factor(Kyphosis, levels = c("present", "absent")),
    prediction = factor(prediction, levels = c("present", "absent"))
  ) |>
  yardstick::conf_mat(truth = Kyphosis, estimate = prediction)
conf_mat

summary(conf_mat) |>
  select(-2) |>
  gt::gt() |>
  gt::fmt_percent(columns = 2, decimals = 1)
```
