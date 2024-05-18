# Binary Search

**Objective:** Find the position of a target element within a sorted array. If the target element is not present, then it should return an indicator that the element isn't found.

**Constraints:** The input array must be sorted.

**Inputs:**

- Sorted array
- A target element

**Output:**

- The index of the target element in the array if it exists
- An indicator, such as $-1$, if the target element does not exist.

**Time complexity:** $O(\log n)$ where $n$ is the number of elements in the array

**Space complexity:** $O(\log n)$ (recursive approach)

### Pseudocode

```
Function binarySearch(arr, left, right, target):
    If left > right:
        Return -1

    Calculate mid as left + (right - left) // 2

    If arr[mid] == target:
        Return mid
    Else if arr[mid] < target:
        Return binarySearch(arr, mid + 1, right, target)
    Else:
        Return binarySearch(arr, left, mid - 1, target)
```

### C++ Implementation

```cpp
#include <iostream>
#include <vector>

int binarySearch(const std::vector<int>& arr, int left, int right, int target) {
    if (left <= right) {
        int mid = left + (right - left) / 2;

        // Check if target is present at mid
        if (arr[mid] == target) {
            return mid;
        }
        // If target greater, ignore left half
        if (arr[mid] < target) {
            return binarySearch(arr, mid + 1, right, target);
        }
        // If target is smaller, ignore right half
        return binarySearch(arr, left, mid - 1, target);
    }

    // Target was not found
    return -1;
}
```
