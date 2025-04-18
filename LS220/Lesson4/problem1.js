// Write a function `removeDuplicates` that removes all
// nodes with duplicate values from a sorted linked list,
// leaving only distinct values from the original list.
// The function should take the head of the sorted linked
// list as input and return the modified list. The list
// should remain sorted after removing duplicates. If the
// list becomes empty after removing all duplicates,
// return null.

/*
--- Problem
INPUT: linked list
OUTPUT: modified linked list

  Rules:
    - Given linked list may contain duplicates
    - Return a list that removes any duplicate integer
      - In this case, only unqiue elements must remain
      - If a number has duplicates, all copies must be removed
      - Thus, only elements that have one copy may remain
      - List should remain sorted

Assumptions
- If passed an empty list, how to proceed?
  - Return null
- Is it safe to assume that the elements will always be integerS?
  - Yes
- Will any of the integers ever by 0 or negative?
  - Possibly
- Will we ever receive more than 1 argument to our fn?
  - No, always precisely one argument


--- Examples
[1, 2, 2, 3, 3, 4, 5, 5]);  // Expected: 1 -> 4 -> null
  - Remove all elements that have more than 1 count
  - 2, 2, 3, 3, 5, 5, 
  - 1, 4 have count of 1
  -> 1 -> 4 -> null

[1, 1, 1, 2, 3]);  Expected: 2 -> 3 -> null
  - 1, 1, 1
  - 2, 3 have count of 1
  -> 2 -> 3 -> null


[1, 2, 3, 4, 5]);  Expected: 1 -> 2 -> 3 -> 4 -> 5 -> null
  - 1, 2, 3, 4, 5 x1
  -> 1 -> 2 -> 3 -> 4 -> 5 -> null


[1, 1, 1, 1, 1]);  // Expected: null
  - 1 x5
  -> null since no unique elements


[1, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5]);  // Expected: 1 -> null
  - 2, 2, 3, 3, 3, 4, 4, 5, 5, 5
  - 1 x1
  -> 1 -> null

--- DS
- given a linked list
- Return amodified link list
- can use tracker to rearrange list
- can loop over list w/ a while loop

--- Algorithm

*/


// Example:
// Input: head = [1, 2, 2, 3, 3, 4, 5, 5]
// Output: [1, 4]
// Explanation: The values 2, 3, and 5 appear multiple times, so
//              they are removed. Only 1 and 4 remain as unique
//              values.

function removeDuplicates(head) {

}

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

function removeDuplicates(head) {
  // Implementation goes here
}

let list1 = createLinkedList([1, 2, 2, 3, 3, 4, 5, 5]);
let list2 = createLinkedList([1, 1, 1, 2, 3]);
let list3 = createLinkedList([1, 2, 3, 4, 5]);
let list4 = createLinkedList([1, 1, 1, 1, 1]);
let list5 = createLinkedList([1, 2, 2, 3, 3, 3, 4, 4, 5, 5, 5]);

printLinkedList(removeDuplicates(list1)); // Expected: 1 -> 4 -> null
printLinkedList(removeDuplicates(list2)); // Expected: 2 -> 3 -> null
printLinkedList(removeDuplicates(list3)); // Expected: 1 -> 2 -> 3 -> 4 -> 5 -> null
printLinkedList(removeDuplicates(list4)); // Expected: null
printLinkedList(removeDuplicates(list5)); // Expected: 1 -> null