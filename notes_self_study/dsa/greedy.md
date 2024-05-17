# Greedy Algorithms

## Fractional Knapsack Algorithm

**Objective:** To maximize the total value of items that can be placed in the knapsack without exceeding its capacity.

**Constraints:** 

- Each item's weight and  value are non-negative integers.
- The capacity of the knapsack is a non-negative integer.
- You can take a fraction of an item.

**Inputs:**

- `capacity`: Maximum weight the knapsack can carry.
- `items`: Array of items where each item has a weight and value.

**Output:** Maximum value that can be obtained with the given capacity of the knapsack.

### Pseudocode

```
class Item:
    weight
    value

    constructor(weight, value):
        this.weight = weight
        this.value = value

function fractionalKnapsack(capacity, items):
    # Sort items based on value-to-weight ratio in descending order
    sort items by (value / weight) in descending order

    totalValue = 0.0

    for item in items:
        if capacity == 0:
            break

        weightToTake = min(item.weight, capacity)
        totalValue += weightToTake * (item.value / item.weight)
        capacity -= weightToTake

    return totalValue
```
