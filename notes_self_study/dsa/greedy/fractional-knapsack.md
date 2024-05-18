# Fractional Knapsack

**Objective:** To maximize the total value of items that can be placed in the knapsack without exceeding its capacity.

**Constraints:** 

- Each item's weight and  value are non-negative integers.
- The capacity of the knapsack is a non-negative integer.
- You can take a fraction of an item.

**Inputs:**

- `capacity`: Maximum weight the knapsack can carry.
- `items`: Array of items where each item has a weight and value.

**Output:** Maximum value that can be obtained with the given capacity of the knapsack.

**Time complexity:** $O(n \log n)$

**Spac complexity:** $O(n)$

### Pseudocode
```
function fractionalKnapsack(capacity, items):
    // items is a list of objects, each having 'weight' and 'value'
    
    // Step 1: Sort items by value-to-weight ratio in descending order
    sort(items by (value / weight) in descending order)

    totalValue = 0.0  // Total value of items in the knapsack

    // Step 2: Iterate through the sorted items and add to the knapsack
    for each item in items:
        if capacity is 0:
            break  // Knapsack is full
        
        weightToTake = min(item.weight, capacity)  // Take as much as possible
        totalValue += weightToTake * (item.value / item.weight)  // Add value of the taken weight
        capacity -= weightToTake  // Reduce remaining capacity of the knapsack

    return totalValue  // Total value of items in the knapsack
```

### C++ Implementation

```cpp
#include <iostream>
#include <vector>
#include <algorithm>

struct Item {
    int weight;
    int value;
    Item(int w, int v) : weight(w), value(v) {}
};

double fractionalKnapsack(int capacity, std::vector<Item>& items) {
    // Sort items by value-to-weight ratio in descending order
    std::sort(items.begin(), items.end(), [](const Item& a, const Item& b) {
        return (double)a.value / a.weight > (double)b.value / b.weight;
    });

    double totalValue = 0.0;

    for (const Item& item : items) {
        if (capacity == 0) {
            break;
        }
        int weightToTake = std::min(item.weight, capacity);
        totalValue += weightToTake * ((double)item.value / item.weight);
        capacity -= weightToTake;
    }

    return totalValue;
}
```

<!-- # Fractional Knapsack -->
<!---->
<!-- **Objective:** -->
<!---->
<!-- **Constraints:** -->
<!---->
<!-- **Inputs:** -->
<!---->
<!-- **Output:** -->
<!---->
<!-- **Time complexity: ** -->
<!---->
<!-- **Space complexity: ** -->
<!---->
<!-- ### Pseudocode -->
<!---->
<!-- ### C++ Implementation -->
