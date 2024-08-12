# Week 3 DATA2902 (Test of Independence)

**Table of proportions**

<img width="422" alt="image" src="https://github.com/user-attachments/assets/0e19f7b7-4e7b-49a0-97a0-cbcd1a3c0ee6">

**Independence**

$X$ and $Y$ are independent if any of the following is true:

- $P(X=x|Y=y)=P(X=x)$
- $P(X=x, Y=y)=P(X=x)P(Y=y)$

<img width="442" alt="image" src="https://github.com/user-attachments/assets/a3297abb-375a-4c16-b92e-b7fa936e1c77">

**Test statistic**

<img width="380" alt="image" src="https://github.com/user-attachments/assets/bc385301-a138-4649-83fb-fb5e9995965a">

**Workflow for test of independence**

<img width="427" alt="image" src="https://github.com/user-attachments/assets/e284da4d-c3f9-459b-b606-349e2cbc61fc">

**Example of TOI using Titanic dataset**

Making the contingency table:

```r
t3a = titanic_df |>
  filter(Class == "3rd",
         Age == "Adult")
y_mat = xtabs(Freq - Sex + Survived, data = t3a)
```

Visualizing via a stacked barplot:

```r
t3a |>
  ggplot() +
  aes(x = Sex,
      y = Freq,
      fill = Survived) +
  geom_col() +
  scale_fill_brewer(palette = "Set1")
```

Getting the test statistic and p value

```r
chisq.test(y_mat, correct = FALSE)
```

<img width="425" alt="image" src="https://github.com/user-attachments/assets/0038ff85-4d82-4005-a0df-ac706d4dae6b">

**General 2-way table**

There's no reason why we can't have more than 2 subvars for each of the 2 var.

<img width="449" alt="image" src="https://github.com/user-attachments/assets/43791989-f7d4-4a01-ab18-638febd7bb06">
 
<img width="428" alt="image" src="https://github.com/user-attachments/assets/1b8f39a4-132e-482c-9eea-00a3688f8a5c">

<img width="430" alt="image" src="https://github.com/user-attachments/assets/19958e9b-dd6a-4407-acef-161abce2f4c0">

<img width="382" alt="image" src="https://github.com/user-attachments/assets/d69389c3-fcd4-415c-a32a-f0279c7bc59e">

<img width="426" alt="image" src="https://github.com/user-attachments/assets/25ce1bb6-88f5-47d8-9671-005bcc92f428">

```r
y = c(24, 32, 46, 22, 38, 38)
n = sum(y)
c = 3
r = 2
y_mat = matrix(y, nrow = r, ncol = c)
colnames(y_mat) = c("Positive",
                    "Negative",
                    "No opinion")
rownames(y_mat) = c("High income",
                    "Low income")
chisq.test(y_mat, correct = F)
```
