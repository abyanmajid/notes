# Merge Sort

**Objective:** Sort an array of integers in ascending order

**Input:** An array of integers

**Output:** A sorted array of integers in ascending order

**Time complexity:** $O(n\log n)$ where $n$ is the number of elements in the array

**Space complexity:** $O(n)$

### Pseudocode
```
Function mergeSort(arr):
    If the length of arr is less than or equal to 1:
        Return arr

    Split the array into two halves, left and right
    left = arr[0:mid]
    right = arr[mid:end]

    Recursively call mergeSort on the left half
    Recursively call mergeSort on the right half

    Merge the sorted halves and return the sorted array

Function merge(left, right):
    Initialize an empty array result
    Initialize pointers leftIndex and rightIndex to 0

    While leftIndex < length of left and rightIndex < length of right:
        If left[leftIndex] <= right[rightIndex]:
            Append left[leftIndex] to result
            Increment leftIndex
        Else:
            Append right[rightIndex] to result
            Increment rightIndex

    Append any remaining elements from left to result
    Append any remaining elements from right to result

    Return result
```

### C++ Implementation
```cpp
#include <iostream>
#include <vector>

// Function to merge two subarrays
std::vector<int> merge(const std::vector<int>& left, const std::vector<int>& right) {
    std::vector<int> result;
    size_t leftIndex = 0, rightIndex = 0;

    // Merge the two subarrays
    while (leftIndex < left.size() && rightIndex < right.size()) {
        if (left[leftIndex] <= right[rightIndex]) {
            result.push_back(left[leftIndex]);
            leftIndex++;
        } else {
            result.push_back(right[rightIndex]);
            rightIndex++;
        }
    }

    // Append any remaining elements from left subarray
    while (leftIndex < left.size()) {
        result.push_back(left[leftIndex]);
        leftIndex++;
    }

    // Append any remaining elements from right subarray
    while (rightIndex < right.size()) {
        result.push_back(right[rightIndex]);
        rightIndex++;
    }

    return result;
}

// Function to perform merge sort
std::vector<int> mergeSort(const std::vector<int>& arr) {
    if (arr.size() <= 1) {
        return arr;
    }

    size_t mid = arr.size() / 2;
    std::vector<int> left(arr.begin(), arr.begin() + mid);
    std::vector<int> right(arr.begin() + mid, arr.end());

    // Recursively sort the left and right halves
    left = mergeSort(left);
    right = mergeSort(right);

    // Merge the sorted halves
    return merge(left, right);
}
```
