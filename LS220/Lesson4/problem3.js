// Write a function removeSecondToLast that removes the
// second-to-last node from a linked list. The function
// should take the head of the linked list as input and
// return the head of the modified list. The list is
// guaranteed to have at least two nodes. Implement the
// solution using only one pass through the list. If
// the list has exactly two nodes, the function should
// remove the head node and return the second node as
// the new head.


/*
--- Problem
iNPUT: linked list
OUTPUT: list w/ 2nd to last element removed

  Rules:
    - Given a list of elements
    - Return a list with the second to last node removed

Assumptions
- Will the list always contain ele that are integers?
  - no, they may be other values
- How should we handle an empty list?
  - Return null
- Will we ever be given multiple arugments?
  - Always passed precisely one arg -- a linked list

--- Examples
- Given [1, 2, 3, 4, 5] return 1 -> 2 -> 3 -> 5 -> null
  - second to last node is at index 3 element 4
  - remove this value
  -> 1 -> 2 -> 3 -> 5 -> null

-> Given 1 -> 2 -> null return 2-> null
  - Only two elements
  - First element (second to last) is 1
  - Remove 1
  -> 2 -> null

-> Given 3 -> 2 -> 1 ->null return 3-> 1 -> null
  - second to last element is 2
  - remove 2
  -> 3->1-> null

-> given 3 -> 2 -> 1 ->null
  - curr = 3, curr.next = 2, curr.next.next = 1
  move forward
  - curr = 2, curr.next = 1, curr.next.next = null
    - at second to las tnode
    - remove this node
  - reassign curr to curr.next
--- DS
- Given linked list
- Want to modify list
- Can use while loop to modify list

--- Algorithm
1. If list is null, return null
2. Remove second element from list
- if the list only contains 2 elements
  - remove the first element
  - return the head of the list
- set dummy to a new node before the head of the list
- set its next pointer to the head
- set curr to the dummy node
- set a pointer to reference the node/value 2 positions ahead of the curr node
  - while the pointer is truthy
    - move the pointer to the next node
    - move curr to the next node
- set the next pointer of the curr node to the node after that (curr.next = curr.next.next)
3. Return modified list
  - Return head of list
*/

function removeSecondToLast(head) {
  if (head.next.next === null) {
    head = head.next;
    return head;
  }

  let dummy = new ListNode(0);
  dummy.next = head;

  let curr = dummy;
  let endOfList = head.next.next;

  while (endOfList) {
    curr = curr.next;
    endOfList = endOfList.next;
  }

  curr.next = curr.next.next;

  return head;
}

// Example 1:
// Input: 1 -> 2 -> 3 -> 4 -> 5
// Output: 1 -> 2 -> 3 -> 5

// Example 2:
// Input: 1 -> 2
// Output: 2

// Example 3:
// Input: 3 -> 2 -> 1
// Output: 3 -> 1

class ListNode {
  constructor(val = 0, next = null) {
    this.val = val;
    this.next = next;
  }
}

function printLinkedList(head) {
  let currentNode = head;
  let listStr = '';
  while (currentNode !== null) {
    listStr += currentNode.val + ' -> ';
    currentNode = currentNode.next;
  }
  listStr += 'null';
  console.log(listStr);
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

// Test cases
let list1 = createLinkedList([1, 2, 3, 4, 5]);
let list2 = createLinkedList([1, 2]);
let list3 = createLinkedList([3, 2, 1]);
let list4 = createLinkedList([1, 2, 3, 4]);
let list5 = createLinkedList([10, 20, 30, 40, 50, 60]);

console.log("Original lists:");
printLinkedList(list1);
printLinkedList(list2);
printLinkedList(list3);
printLinkedList(list4);
printLinkedList(list5);

console.log("\nAfter removing second-to-last node:");
printLinkedList(removeSecondToLast(list1)); // Expected: 1 -> 2 -> 3 -> 5 -> null
printLinkedList(removeSecondToLast(list2)); // Expected: 2 -> null
printLinkedList(removeSecondToLast(list3)); // Expected: 3 -> 1 -> null
printLinkedList(removeSecondToLast(list4)); // Expected: 1 -> 2 -> 4 -> null
printLinkedList(removeSecondToLast(list5)); // Expected: 10 -> 20 -> 30 -> 40 -> 60 -> null