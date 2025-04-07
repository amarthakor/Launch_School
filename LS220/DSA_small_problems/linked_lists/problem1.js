/*
Given a singly linked list and a specific value (referred to as the 'key'), your task is to determine how many times this key appears within the linked list. For instance, given a linked list like 1->2->1->2->1->3->1 and a key of 1, the expected result would be 4, as the key 1 appears four times in the list.

8:55pm
--- Problem
INPUT: simgly linked list and integer `key`
OUTPUT: integer

  Rules:
    - Given a simply linked list of integers and an integer key
    - return an integer where
      - integer represents the count/ frequency of how many times
        the key appears in the linked list.

Assumptions:
- Will we always be provided w a linked list for arg1
  - Yes
- Will the linked list always contain integers?
  - Yes
- Can we ever be provided an empty linked list?
  - Yes, in that case return 0
- Will the second arg always be an integer?
  - Yes
- Will we ever have missing args?
  - No, expect precisely 2 arguments

--- Examples
- Given: [1, 2, 1, 2, 1, 3, 1], 1 return 4
  - 1, 1, 1, 1
  - 1count = 4
  return 4

- Given: [], 1 return 0
  - empty list thus we return 0

- given: [4, 4, 4, 4], 4 return 4
  - 4, 4, 4, 4
  - 4count = 4
  -> return 4

--- DS
- given linked list
- no need to use other DS
- Can traverse linked list and assess each val to determine match w/ key

--- Algorithm
1. Return 0 if given empty list
2. Set count to 0
3. Traverse list and icnrement count every time we encounter a match
- set curr to head
- while curr node is != null
  - if curr val === key
    - increment count by +1
    - set curr to curr.next (curr now references the next node not current)
  - else curr val != key
    - set curr to curr.next
4. Return the count

[1, 2, 3, 4, 5], key = 1 -> return 1
- count = 0
- while curr != null
  - 1 === 1
    - count += 1
    - curr = curr.next (1 -> 2)
  - curr (2 !== 1)
    - curr = curr.next (curr moves from 2 -> 3)
- return count (1)
*/


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

function countKeyOccurrences(head, key) {
  let count = 0;
  let curr = head;

  while (curr !== null) {
    if (curr.val === key) {
      count += 1;
    }
    curr = curr.next
  }
  return count;
}

let list1 = createLinkedList([1, 2, 1, 2, 1, 3, 1]);
let list2 = createLinkedList([4, 4, 4, 4]);
let list3 = createLinkedList([1, 2, 3, 4, 5]);
let list4 = createLinkedList([5, 5, 1, 2, 3, 5, 5]);
let list5 = createLinkedList([]);
let list6 = createLinkedList([1, 2, 3, 1, 1]);

console.log(countKeyOccurrences(list1, 1) === 4);
console.log(countKeyOccurrences(list2, 4) === 4);
console.log(countKeyOccurrences(list3, 1) === 1);
console.log(countKeyOccurrences(list4, 5) === 4);
console.log(countKeyOccurrences(list5, 1) === 0);
console.log(countKeyOccurrences(list6, 1) === 3);

// All test cases should log true.