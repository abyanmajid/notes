# Bucket Sort

Bucket Sort distributes elements into several "buckets" based on a specific range, sorts each bucket individiually, and then concatenates the sorted buckets to form the final sorted array.

**What it's good for:** Problems like top $k$ most frequent elements (a lot to do with frequencies!).

- **Time complexity:** $O(n+k)$ avg. case, $O(n^2)$ worst case (if all elements end up in the same bucket)

- **Space complexity:** $O(n+k)$

```java
public class BucketSort {

    public static void bucketSort(float[] arr) {
        int n = arr.length;

        List<Float>[] buckets = new ArrayList[n];

        for (int i = 0; i < n; i++) {
            buckets[i] = new ArrayList<>();
        }

        for (int i = 0; i < n; i++) {
            int bucketIndex = (int) (n * arr[i]); // Bucket index
            buckets[bucketIndex].add(arr[i]);
        }

        for (int i = 0; i < n; i++) {
            Collections.sort(buckets[i]);
        }

        int index = 0;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < buckets[i].size(); j++) {
                arr[index++] = buckets[i].get(j);
            }
        }
    }
```
