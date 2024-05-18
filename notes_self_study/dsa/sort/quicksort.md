# Quicksort

**Objective:** Sort an array of integers in ascending order

**Inputs:** An array of integers

**Output:** A sorted array of integers in ascending order

**Time complexity:** $O(n^2)$, which occurs when the pivot selection is poor (i.e. always choosing the smallest or largest element as the pivot in the sorted array)

**Space complexity:** $O(n)$ due to recursion stack

### Pseudocode
```
Function quicksort(arr, low, high):
    If low < high:
        pivotIndex = partition(arr, low, high)
        quicksort(arr, low, pivotIndex - 1)
        quicksort(arr, pivotIndex + 1, high)

Function partition(arr, low, high):
    pivot = arr[high]
    i = low - 1

    For j from low to high - 1:
        If arr[j] < pivot:
            i = i + 1
            Swap arr[i] and arr[j]

    Swap arr[i + 1] and arr[high]
    Return i + 1
```

### C++ Implementation
```cpp
#include <iostream>
#include <vector>

// Function to swap two elements
void swap(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}

// Function to partition the array
int partition(std::vector<int>& arr, int low, int high) {
    int pivot = arr[high]; // Choose the last element as the pivot
    int i = low - 1; // Index of the smaller element

    for (int j = low; j < high; j++) {
        // If the current element is smaller than or equal to the pivot
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]); // Swap arr[i] and arr[j]
        }
    }
    swap(arr[i + 1], arr[high]); // Swap arr[i + 1] and arr[high] (or pivot)
    return i + 1;
}

// Function to perform quicksort
void quicksort(std::vector<int>& arr, int low, int high) {
    if (low < high) {
        // Partition the array
        int pivotIndex = partition(arr, low, high);

        // Recursively sort the subarrays
        quicksort(arr, low, pivotIndex - 1);
        quicksort(arr, pivotIndex + 1, high);
    }
}
```
