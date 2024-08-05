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

<img width="320" alt="image" src="https://github.com/user-attachments/assets/aec38fb3-36bb-468a-977f-2d45fbadb768">

**Accuracy:** The probability that the test is correct,

$$\displaystyle\frac{a+d}{a+b+c+d}$$

**Misclassification rate:** The probability that the test is incorrect,

$$\displaystyle\frac{b+c}{a+b+c+d}$$

**False negative (FN) rate:** The probability the test is negative, given the subject actually has the disease

$$\displaystyle P(S^-|D^+)=\frac{c}{a+c}$$

**True positive (TP) rate:** The probability the test is positive, given the subject actually has the disease

$$P(S^+|D^+)=\frac{a}{a+c}$$

**False positive (FP) rate:** The probability the test is positive, given the subject does NOT have the disease

$$P(S^+|D^-)=\frac{b}{b+d}$$

**True negative (TN) rate:** The probability the test is negative, given the subject does NOT have the disease

$$P(S^-|D^-)=\frac{d}{b+d}$$

**Positive predictive value:** The probability the subject has the disease, given the test is positive

$$P(D^+|S^+)=\frac{a}{a+b}$$

**Negative predictive value:** The probability the subject does NOT have the disease, given the test is negative,

$$P(D^-|S^-)=\frac{d}{c+d}$$


