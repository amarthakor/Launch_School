/*
Given the head of a sorted singly linked list, eliminate any duplicate elements, ensuring each value in the list is unique. The resulting linked list must remain sorted. Modify the linked list and return the head of the revised, duplicate-free list.

1:20pm
--- Problem
iNPUT: sorted linked list
OUTPUT: modified linked list

  Rules:  
  - Given a sorted singly linked list
  - Return a modified linked list where
    - Duplicate elements are removed
    - Each element in the list in unique
    - List must remain sorted
    - Return the head of the modified list

Assumptions:
- Is it safe to assume that every element in the list will be an integer?
  - Yes, nodes will always store integers, never anything else
- What if the list provided is empty?
  - Return null
- Will we ever be provided multiple args?
  - No, always precisely one arg -- a linked list
- Will the list ever a cyclical or doubly linked list?
  - No, always a singly linked list

--- Examples
- Given: 1-1-2 return 1->2->null
  - 1
  - 1 (duplicate needs to be removed)
  - 2
  - 1 -> 2 -> null

- Given: createLinkedList([2, 2, 2, 3, 3])  return: 2 -> 3 -> null
  - 2
  - 2 (dupe)
  - 2 (dupe)
  - 3
  - 3 (dupe)
  - uniqs: 2, 3
  => 2 -> 3 -> null

--- DS
- Given linked list DS
  - maintain linked list
- ITerate over linked list
- Remove any dupes
- Can use pointers to traverse the list

--- Algorithm
1. If given null return null
2. Modify the list and remove any dupes
- Set curr to head;
- while curr.next !== null
  - if curr node and next node (curr.next) are the same
    - reassign curr.next to curr.next.next
  - if curr node and the next node (curr.next) are diffferent - we have 2 uniq eles
    - slide curr node to curr.next node (the new uniq ele)
3. Return modified list

example: [2, 2, 2, 3, 3] return 2 -> 3 -> null
- dummy is set to node 0, dummy.next is set to head
- prev is set to dummy (node 0)
- curr is set to head (node refernecing 2 at index 0)
- while curr.next is not equal to null
  - (iteration 1)
  - curr node = 2. index 0, curr.next node = 2 index 1
    - curr = 2, index 0,
    - curr.next 2, index 1 -> 2, index 2
  - (iteration 2)
    - curr node = 2, and next node also = 2 thus
      - curr = 2 index 0
      - curr.next = 2 index 1 -> curr.next = curr.next.next
      - curr.next now = 3, index 3
  - (iteration 3)
    - curr node = 2 index 0
    - curr.next = 3 index 3
    - thus we execute my else branch
      - reasign curr to curr.next
      - curr 2 index0 -> 3, index 3
  - (iteration 4)
    - curr node = 3, idnex 3
    - curr.next = 3, index 4
      - curr.next = curr.next.next
      - curr.next = 3, index 4 -> null end of list
  - (iteration 5)
    - curr = 3, index 3
    - curr.next = null so 5th iteraiton never executes

- return head
- 2->3->null
*/

function deleteDuplicates(head) {
  if (head === null) return null;
  let curr = head;

  while (curr.next !== null) {
    if (curr.val === curr.next.val) {
      curr.next = curr.next.next;
    } else {
      curr = curr.next;
    }
  }

  return head;
}

function ListNode(val) {
  this.val = val;
  this.next = null;
}

function createLinkedList(arr) {
  let head = new ListNode(0);
  let current = head;
  arr.forEach(val => {
    current.next = new ListNode(val);
    current = current.next;
  });
  return head.next;
}

function printLinkedList(head) {
  let currentNode = head;
  let listStr = '';
  while (currentNode !== null) {
      listStr += currentNode.val + ' -> ';
      currentNode = currentNode.next;
  }
  listStr += 'null'; // Indicate the end of the list
  console.log(listStr);
}

let list1 = createLinkedList([1, 1, 2]);
let list2 = createLinkedList([1, 1, 2, 3, 3]);
let list3 = createLinkedList([1, 2, 3, 3, 4]);
let list4 = createLinkedList([2, 2, 2, 3, 3]);
let list5 = createLinkedList([5]);
let list6 = createLinkedList([]);

printLinkedList(deleteDuplicates(list1)); // Expected: "1 -> 2 -> null"
printLinkedList(deleteDuplicates(list2)); // Expected: "1 -> 2 -> 3 -> null"
printLinkedList(deleteDuplicates(list3)); // Expected: "1 -> 2 -> 3 -> 4 -> null"
printLinkedList(deleteDuplicates(list4)); // Expected: "2 -> 3 -> null"
printLinkedList(deleteDuplicates(list5)); // Expected: "5 -> null"
console.log(deleteDuplicates(list6)); // Expected: "null"