# Interval Partition

**Objective:** To partition a set of intervals into the minimum number of groups such that no two intervals in the same group overlap.

**Constraints:**

- Each interval is represented as a pair $(start, end)$
- Intervals can overlap, meaning that for two intervals $(a,b)$ and $(c,d)$, it is possible that $(a\lt d \land c\lt b)$.

**Input:** A list of interval, where each interval is represented as a tuple $(start,end)$

**Output:** The minimum number of groups (or partitions) such that no two intervals in the same group overlap.

**Time complexity:** $O(n \log n)$

**Space complexity:** $O(n)$

### Pseudocode
```
function intervalPartition(intervals):
    // Step 1: Sort intervals by start time
    sort intervals by start time

    // Step 2: Use a min-heap to track end times of ongoing intervals
    initialize a minHeap to store end times of ongoing intervals
    minHeap is initially empty

    for each interval in intervals:
        start, end = interval.start, interval.end

        // Step 3: If the min-heap is not empty and the earliest end time is less than or equal to the current start time
        if minHeap is not empty and minHeap.peek() <= start:
            // Remove the earliest end time from the heap
            minHeap.pop()

        // Step 4: Add the current interval's end time to the heap
        minHeap.push(end)

    // The size of the heap is the number of groups needed
    return size of minHeap
```

### C++ Implementation
```cpp
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

struct Interval {
    int start;
    int end;
    Interval(int s, int e) : start(s), end(e) {}
};

// Comparator function to sort intervals by start time
bool compareIntervals(const Interval& a, const Interval& b) {
    return a.start < b.start;
}

int intervalPartition(std::vector<Interval>& intervals) {
    // Step 1: Sort intervals by start time
    std::sort(intervals.begin(), intervals.end(), compareIntervals);

    // Step 2: Min-heap to track end times of ongoing intervals
    std::priority_queue<int, std::vector<int>, std::greater<int>> minHeap;

    for (const Interval& interval : intervals) {
        int start = interval.start;
        int end = interval.end;

        // Step 3: If the heap is not empty and the earliest end time is <= start time
        if (!minHeap.empty() && minHeap.top() <= start) {
            // Remove the earliest end time
            minHeap.pop();
        }

        // Step 4: Add the current interval's end time to the heap
        minHeap.push(end);
    }

    // The size of the heap is the number of groups needed
    return minHeap.size();
}

int main() {
    std::vector<Interval> intervals = {
        Interval(1, 4),
        Interval(2, 5),
        Interval(9, 12),
        Interval(5, 9),
        Interval(5, 12)
    };

    int result = intervalPartition(intervals);
    std::cout << "Minimum number of groups required: " << result << std::endl;
    return 0;
}
```
