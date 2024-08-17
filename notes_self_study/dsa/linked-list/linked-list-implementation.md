# Linked List Implementation

```py
class Node:
    def __init__(self, val = 0):
        self.val = val
        self.next = None

class MyLinkedList:
    def __init__(self):
        self.head = None

    def get(self, index: int) -> int:
        curr = self.head

        i = 0
        while curr:
            if i == index:
                return curr.val
            curr = curr.next
            i += 1
        
        return -1

    def addAtHead(self, val: int) -> None:
        new_node = Node(val)
        new_node.next = self.head
        self.head = new_node

    def addAtTail(self, val: int) -> None:
        new_node = Node(val)
        if self.head is None:
            self.head = new_node
            return
        
        curr = self.head
        while curr.next:
            curr = curr.next
        curr.next = new_node

    def addAtIndex(self, index: int, val: int) -> None:
        if index == 0:
            self.addAtHead(val)
        elif index > 0:
            new_node = Node(val)
            curr = self.head

            i = 0
            while curr:
                if i == index - 1:
                    new_node.next = curr.next
                    curr.next = new_node
                    break
                curr = curr.next
                i += 1

    def deleteAtIndex(self, index: int) -> None:
        if self.head is None:
            return

        if index == 0:
            self.head = self.head.next
            return

        current = self.head
        for _ in range(index - 1):
            if current is None or current.next is None:
                return
            current = current.next

        if current.next is not None:
            current.next = current.next.next
```
