# Week 3 DATA2902 LIVE LEC (Measures of Risk)

**Prospective study** 

A study design where one or more samples (called "COHORTS") are followed prospectively and subsequent status evaluations with respect to a disease or outcome are conducted to determine which risk factors are associated with it.

IMPORTANT: 

- A prospective study is based on subjects who are initially identified as _disease-free_ and classified by presence or absence of a _risk factor_
- A random sample from each group is followed in time (prospectively) until eventually classified by the disease outcome
- In a prospective study, the number of participants in each of the risk factor groups (row totals) is fixed by design

In a prospective study, we take 2 random samples:

- One sample from the risk factor roup (subpopulation) $R^+$
- Another from the non-risk factor group $R^-$

We then wait to se how many in each group develop the disease. From thereon, we can estimate $P(D^+|R^-)$ as well as $P(D^-|R^-)$

WHICH IS TO SAY, as LIMITATION, we cannot estimate $P(R^+|D^+)$ or $P(R^-|D6\^)$ since we didnt take fas

**Prospective study example - Asthma:**

A large group of infants with mild respiratory problems (but asthma free) is split into those with a family history of hay fever $R^+$, and those without, $R^-$. Random samples of 85 from the first group and 405 from the second group are selected for special study. The results is depicted below:

<img width="432" alt="image" src="https://github.com/user-attachments/assets/b99bf204-9a57-4607-86d4-a07fbe1f7e49">

- The RISK FACTOR is family history of hay fever.
- The DISEASE is asthma by age 12.

**Retrospective (or case control) studies:**

A study that compares patients who have a disease (or outcome of interest) with patients who do NOT have the disease or outcome (controls), and looks back retrospectively to compare how frequently the exposure to a risk factor is present in each group to determine the relationship between the risk factor and the disease.

IMPORTANT: A restrospective study is based on random samples from each of the two outcome categories which are followed back (retrospectively) to determine the presence or absencee of the _risk factor_ for each individual.

**Retrospective study example - Hodgkin's disease:**

Researchers collected data on a group of 101 patients of Hodgkin's Disease $D^+$, and a control group of 107 non-Hodgkin's patients $D^-$. They want to investigate the effect of tonsillectomy (RISK FACTOR) as a barrier to Hodgkin's disease. The results are as follows:

<img width="497" alt="image" src="https://github.com/user-attachments/assets/a6e2c39d-d60a-4035-94fa-173687a27ce8">

In a retrospective study, the $D^+$ total and $D^-$ total are fixed by design.

**Application to prospective and retrospective studies:**

In both prospective and retrospective studies, we have:

- A population,
- A subpopulation/attribute (event) deterkmined by a risk factor $R^+$ (with complementary subpopulation/attribute $R^-$)
- A subpopulation/attribute determined by having/developing the disease $D^+$ (with complementary subpopulation/attribute $D^-$)

The main difference prospective and retrospective studies are which (sub)popuations we can sample from.

In a prospective study, it's generally valid to answer $P(D^+|R^+)$ and $P(D^-|R^-)$. In a retrospective study, it's generally valid to answer $P(R^+|D^+)$ and $P(R^-|D^-)$

**Relative Risk**

The RELATIVE RISK is defined as a "ratio of two conditional probabilities"

$$RR=\frac{P(D^+|R^+)}{P(D^+|R^-)}$$

Since probabilities are bounded between 0 and 1,

$$RR=\frac{P(D^+|R^+)}{P(D^+|R^+)}\rightarrow\infty\text{ as }P(D^+|R^-) -> 0$$

$$RR=\frac{P(D^+|R^+)}{P(D^+|R^-)}\rightarrow 0 \text{ as }P(D^+|R^-) -> 0$$

and $RR\approx 1$ when $P(D^+|R^+)\approx P(D^+|R^-)$

Or, all above defined more concretely: If $D$ and $R$ are independent, then

$$P(D|R)=P(D)$$

and so,

$$RR=\frac{P(D^+|R^+)}{P(D^+|R^-)}=\frac{P(D^+)}{P(D^+)}=1$$

**Relative risk - Interpretation:**

The relative risk is the ratio of the probability of having the disease in the group with the risk factor to the probability of having the disease in the group without the risk factor.

- $RR=1$ means there is NO DIFFERENCE between the two groups.
- $RR<1$ implies the disease is LESS LIKELY to occur in the group  with the risk factor
- $$RR>1$$ implies the disease is MORE LIKELY to occur in the group with the risk factor

**Relative risk - prospective studies:**

<img width="240" alt="image" src="https://github.com/user-attachments/assets/063b2b75-9ba3-4dd3-b682-210d46d8038e">

Given data from a prospective study, we can estimate:

- $\displaystyle P(D^+|R^+)=\frac{a}{a+b}$
- $\displaystyle P(D^+|R^-)=\frac{c}{c+d}$

Relative risk: 

$$\displaystyle \hat{RR}=\frac{P(D^+|R^+)}{P(D^+|R^-)}=\frac{a(c+d)}{c(a+b)}$$

**Relative risk - retrospetive studies:**

<img width="299" alt="image" src="https://github.com/user-attachments/assets/0b6a91ef-96e0-413a-b555-e92580c8850f">

_WE CANT APPLY RELATIVE RISK TO RETROSPECTIVE STUDIES._

In a retrospective study, we identify two groups, $D^+$ and $D^-$, and we retrospectively assess each group for their risk status, $R^+$ and $R^-$

Due to the design, we CANNOT extract any info about the incidence of $D$ in the pop. because the proportions of cases with $D^+$ and $D^-$ were decided by the investigator. That is, we CANNOT estimate:

- $P(D^+|R^+)$
- $P(D^+|R^-)$
- $\displaystyle RR=\frac{P(D^+|R^+)}{P(D^+|R^-)}$

**Odds ratio**

Odds are a ratio of probabilities - they're used as an alternative way of measuring the likelihood of an event occuring.

If the probability of event $A$ is $P(A)$, then the ODDS of event $A$ is defined as

$$\displaystyle O(A)=\frac{P(A)}{1-P(A)}$$

In the risk/disease setting, the probability of disease for $R^+$ patients is $P(D^+|R^+)$, so the odds is

$$O(D^+|R^+)=\frac{P(D^+|R^+)}{1-P(D^+|R^+)}=\frac{P(D^+|R^+)}{P(D^-|R^+)}$$

**Equivalent definitions of odds ratio (OR)**

The ratio of odds of a disease for $R^+$ patients to the corresponding odds for $R^-$ patients is the odds ratio $OR$:

$$\displaystyle OR=\frac{O(D^+|R^+)}{O(D^+|R^-)}=\frac{\frac{P(D^+|R^+)}{P(D^-|R^+)}}{\frac{P(D^+|R^-)}{P(D^-|R^-)}}$$

This ratio is actually identical to

$$OR=\frac{O(R^+|D^+)}{O(R^+|D^-)}=\frac{\frac{P(R^+|D^+)}{P(R^-|D^+)}}{\frac{P(R^+|D^-)}{P(R^-|D^-)}}$$

which means that unlike $RR$, $OR$ can actually be found from both prospective and retrospective studies.

**Odds ratio (OR) and relative risk (RR) in R:**

```r
table2 = matrix(c(67993, 1386, 6877, 91, 10483, 206, 8910, 252), ncol = 2, byrow
= T)

colnames(table2) = c("No complications", "Postop complication(s)")
rownames(table2) = c("No isolation", "<= 3 days", "4-7 days", ">= 8 days")

e1 = table2[1:2, 2:1]

# compute odds ratio
mosaic::oddsRatio(e1, verbose = T)
mosaic::relrisk(e1)
```

**Standard error and confidence intervals**

The asymptotic standard error for the log odds ratio estimator is:

$$\displaystyle\text{SE}(\log(\hat{OR}))=\sqrt{\frac{1}{a}+\frac{1}{b}+\frac{1}{c}+\frac{1}{d}}$$

The approximate 95% confidence interval for odds ratio is

$$[\text{exp}(\log(\hat{OR})-1.96\text{SE}(\log(\hat{OR}))), \text{exp}(\log(\hat{OR})+1.96\text{SE}(\log(\hat{OR})))]$$

For odds ratio, if the CI does NOT include 1, then it suggests **a statistically significant association between the variables**. Conversely, if the CI DOES include 1, then there is **no significant association.**
