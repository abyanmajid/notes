# Quicksort

- **Worst case:** $O(n^2)$
- **Average case:** $O(n\log n)$

```java
public class Playground {

  // this implementation of quicksort has the pivot
  // at the end of the array
  private static void quickSort(int[] array, int start, int end) {
    if (end <= start) {
      return;
    }

    int pivot = partition(array, start, end);

    quickSort(array, start, pivot - 1);
    quickSort(array, pivot + 1, end);
  }

  private static int partition(int[] array, int start, int end) {

    int pivot = array[end];
    int i = start - 1;

    for (int j = start; j <= end - 1; j++) {
      if (array[j] < pivot) {
        i++;
        int temp = array[i];
        array[i] = array[j];
        array[j] = temp;
      }
    }

    i++;
    int temp = array[i];
    array[i] = array[end];
    array[end] = temp;

    return i; // i is the location of our pivot
  }

  public static void main(String args[]) {
    int[] array = {8, 2, 5, 3, 9, 4, 7, 6, 1};

    quickSort(array, 0, array.length - 1);

    for (int i : array) {
      System.out.print(i + " ");
    }
  }
}
```
