# Reverse a Linked List

```py
class Solution:
  def reverseList(self, head: Option[ListNode]) -> Optional[ListNode]:
    curr, prev = head, None

    while curr:
      nxt = curr.next
      curr.next = prev
      prev = curr
      curr = nxt

    return prev
```
