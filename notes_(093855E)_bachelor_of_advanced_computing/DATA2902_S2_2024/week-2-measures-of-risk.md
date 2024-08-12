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
