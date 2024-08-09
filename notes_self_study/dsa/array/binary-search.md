# Binary Search

Finds the position of a target value within a sorted array.

Current value starts from the middle element of the array. 

1. If target value is greater than the current value, then disregard everything to the left of the current element and current moves to the middle of the new, shorter array.
2. If target value is smaller than the current value, then disregard everything to the right of the current element and current moves to the middle of the new, shorter array.
3. Return the position of the current value if its equal to the target value.

Time complexity: $O(\log n)$
