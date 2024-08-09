# Binary Search

Finds the position of a target value within a sorted array.

Current value starts from the middle element of the array. 

1. If target value is greater than the current value, then disregard everything to the left of the current element and current moves to the middle of the new, shorter array.
2. If target value is smaller than the current value, then disregard everything to the right of the current element and current moves to the middle of the new, shorter array.
3. Return the position of the current value if its equal to the target value.

Time complexity: $O(\log n)$

```java
public class Playground {
  public static int binarySearch(int[] arr, int target) {
    int low = 0;
    int high = arr.length - 1;

    while (low <= high) {
      int middle = low + (high - low) / 2;
      int value = arr[middle];

      if (value < target)
        low = middle + 1;
      else if (value > target)
        high = middle - 1;
      else
        return middle;
    }

    return -1;
  }
}
```
