# Proof in Mathematics

*Date written: May 24, 2023* \
*By: Abyan Majid*

- [Proof in Mathematics](#proof-in-mathematics)
  - [Basic terminology and overview](#basic-terminology-and-overview)
  - [Types of Proof](#types-of-proof)
    - [Proof by Construction](#proof-by-construction)
      - [Example of Proof by Construction](#example-of-proof-by-construction)
    - [Proof by Contradiction](#proof-by-contradiction)
      - [Example of Proof by Contradiction](#example-of-proof-by-contradiction)
    - [Proof by Induction](#proof-by-induction)
      - [Example of Proof by Induction](#example-of-proof-by-induction)

## Basic terminology and overview
- **Defintion:** A definition is a description of a certain object or concept. Defitions are used to derive mathematical statements, therefore it is imperative that definitions are clear, because otherwise, there will be trouble in communicating the statements to the readers. For instance, the following is an example of an improper and proper definition of a sample function $D(t)$:
  
  - **Improper definition:** $D(t)$ is a function that models the distance covered by a car.
  - **Proper definition:** $D(t)$, $t_1 \leq t \leq t_2$ is a function that models the distance covered by a car *D* in meters, given time *t* in seconds, and has a domain $[D]=\{t|t_1 \leq t \leq t_2\}$, where $t_1$ is the time when the car starts moving and $t_2$ is the time when it stops.

- **Proof:** A proof is a convincing logical argument that a given mathematical statement is true or false.

- **Theorem:** A theorem is a mathematical statement proved true.

## Types of Proof

### Proof by Construction
**A proof of construction** is a way to prove a theorem by showing how to construct the theorem. It is usually used to prove theorems that state a certain object with specific properties exist. 

#### Example of Proof by Construction
**Theorem:** There exists a right-angled triangle with side lengths 3, 4, and 5.

**Proof** *(step-by-step)***:**
1. Draw a straight line $a$ which is 3 units long, and label its endpoints $a_{(1)}$ and $a_{(2)}$
2. Perpendicular to $a$, draw a second straight line $b$ which is 4 units long, such that its endpoint $b_{(1)}$ is connected to $a_{(1)}$ 
3. Connect $a_{(2)}$ and $b_{(2)}$ using a third straight line $c$ which is 5 units long. Completing this step would show that a triangle with side lengths 3, 4, and 5, have been formed.
4. To verify that it is a right-angled triangle, use the Pythagorean Theorem, $a^2+b^2=c^2$. Substituting the values, we get $3^2+4^2=5^2$, which simplifies to $9+16=25$, which confirms that the triangle is right-angled.

### Proof by Contradiction
Another way to prove a theorem is by assuming that the theorem is false, and then try to prove it thereon - which should expectedly lead to a false consequence, called a contradiction. Therefore, proving that the theorem is correct.

#### Example of Proof by Contradiction
**Theorem:** The square root of 2 is an irrational number.

**Proof** *(step-by-step)***:**
1. Assume, for the sake of contradiction, that $\sqrt 2$ is a rational number.
2. So, it can be expressed as $\sqrt 2=\frac{a}{b}$, where $a$ and $b$ are integers with no common factors other than 1, and $b\not ={0}$.
3. We have $(\sqrt 2)^2=2$, so $2=(\frac{a}{b})^2$, which implies $2b^2=a^2$.
4. Since $a^2$ is even, $a$ must be even as well. Hence, let $a=2k$, where $k$ is an integer. Substituting this into the equation, we get: $2b^2=(2k)^2=4k^2$, which, upon dividing both sides by 2 leads to $b^2=2k^2$
5. However, if both $a$ and $b$ are even, they have a common factor of 2, contradicting the assumption that $\frac{a}{b}$ is a fraction in lowest terms.
6. Hence, the assumption that $\sqrt 2$ is a rational number must be false. Therefore, $\sqrt 2$ is an irrational number.

### Proof by Induction
Proof by induction is a method used to show that all elements of an infinite set have a certain property. A proof of induction is divided into two proofs, the *basis* and the *induction step*, where:

- **Basis:** (also known as *base case*) A proof that a statement holds true for a particular value or set of values.
- **Induction step:** A proof that if the statement holds true for the value(s) as tackled in the basis, it must also hold true for the next value, and then every other value in the set.

To illustrate, let $P$ denote a property in a given set, say the set of natural numbers $\N=\{1,2,3,...\}$, and *i* be its index in the set. Hence, the basis and induction step could be:

- **Basis:** Proves that $P(1)$ is true
- **Induction step:** Proves that if $P(1)$ is true, and assuming that $P(i)$ is true, then for every $i>1$, $P(i+1)$ is also true.

In the induction step, the assumption that $P(i)$ is true is called the *induction hypothesis*.

#### Example of Proof by Induction
**Theorem:** For all positive integers $n$, the sum of the first $n$ positive integers is given by the formula $1+2+3+...+n=\frac{n(n+1)}{2}$.

**Basis:** The equation is true for $n=1$, because $1=\frac{1(1+1)}{2}$

**Induction hypothesis:** Assume that the equation is true for a positive integer $k$, such that $1+2+3+...+k=\frac{k(k+1)}{2}$ is true.

**Induction step:**
1. Adding $(k+1)$ to both sides of the equation gives $1+2+3+...+k+(k+1)=\frac{k(k+1)}{2}+(k+1)\rArr 1+2+3+...+k+(k+1)=\frac{(k+1)(k+2)}{2}$
2. Therefore, the equation is true for $n=k+1$, and is true for all positive integers $n$.
3. Therefore, the theorem is correct.