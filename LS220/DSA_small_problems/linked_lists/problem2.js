/*
Given the head of a singly linked list containing integers, create a new linked list where each node represents the frequency of a unique element from the original list. The order of nodes in the new list doesn't matter. Return the head of this new frequency list.
6:20pm

--- Problem
INPUT: linked list
OUTPUT: new linked list

  Rules:
    - Given: a linked list of integers
    - Return: new linked list where
      - linked list is composed of integers
      - integers represent count of an element from the original list
    - Order of nodes in my new list doesn't matter

Assumptions:
- Will the provided linked list nodes always contain integer elements
  - Yes
- Will I ever be provided ana rgument that isn't a linked list?
  - No
- What if I'm given an empty list?
  - Return []

--- Examples
- Given: [1, 1, 2, 1, 3], return list composed of [3, 1, 1]
  - 1, 1, 1
  - 2
  - 3
  -> [3, 1, 1]

- Given: [] return list compsoed of -> null
  - Given empty list we shall return null

- Given: [1, 1, 2, 2, 2], return list 2 -> 3 -> null
  - 1, 1, 
  - 2, 2, 2
  - 2, 3
  -> 2 -> 3 -> null

--- DS
- working w/ linked list DS
- can use object to create pairs of uniq eles and their counts
- can create array of counts from object
- can use array of counts to create a linked list
- return this list
- utilize LL, arr, and obj DS

--- Algorithm
1. If given an empty list, return null *if solution handles this, remove gaurd clause
2. Create an obj filled w/ KV pairs of uniq eles and their freq's
  - Create an obj `uniqCounts`
  - set curr to head
  - loop thru the given list
    - while curr.next != null
      - if the current value does not exist as a key in my obj
        - create a KV pair where the curr.value is set to 1
      - else
        - increment the KV pair at the curr.val by + 1
      - curr = curr.next;
  - return `uniqCounts`
3. Create an array of values from my obj
  - create an array called `counts`
  - loop thru KV pairs
    - append the current value into `counts`
  - return `counts`

4. Create a linked list from the eles in my array of counts
  - utilize create linked list fn to create a linked list based off counts
  - return this list

Given list:[1, 1, 2, 2, 2] -> return list: [2, 3]
  - create obj {}
  - set currentNode to head (1)
  - while currentNode.next != null
    - obj -> {1:1}
    - currentNode.next (1)
    - currentNode = currentNode.next (1 -> 1)
    - obj -> {1:2}
    - currentNode = currentNode.next (1 -> 2)
    - obj {1:2, 2:1}
    - currentNode = currentNode.next (2 -> 2)
    - obj {1:2, 2:2}
    ...
    - obk {1:2, 2:3}
[]
[2]
[2, 3]

createlinkedlist([2, 3]) -> 2 -> 3 -> null

function createLinkedList(arr) {
  let head = new ListNode(0);
  let curr = head;

  arr.forEach(node => {
    curr.next = new ListNode(node);
    curr = curr.next;
  });

  return head.next;
}
*/

function findUniqCounts(head) {
  let uniqCounts = {};
  let curr = head;

  while (curr !== null) {
    if (!uniqCounts[curr.val]) {
      uniqCounts[curr.val] = 1;
    } else {
      uniqCounts[curr.val] += 1;
    }

    curr = curr.next;
  }

  return uniqCounts;
}

function getCountValues(obj) {
  let counts = [];
  for (let key in obj) {
    counts.push(obj[key]);
  }

  return counts;
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

function linkedListToArray(head) {
  let result = [];
  while (head) {
    result.push(head.val);
    head = head.next;
  }
  return result;
}

function testFrequencyList(input, expected) {
  let result = linkedListToArray(createFrequencyList(createLinkedList(input)));
  if (result.length !== expected.length) return false;
  let freq1 = new Map(), freq2 = new Map();
  for (let num of result) freq1.set(num, (freq1.get(num) || 0) + 1);
  for (let num of expected) freq2.set(num, (freq2.get(num) || 0) + 1);
  if (freq1.size !== freq2.size) return false;
  for (let [key, value] of freq1) {
    if (freq2.get(key) !== value) return false;
  }
  return true;
}

function createFrequencyList(head) {
  let uniqCounts = findUniqCounts(head);
  let counts = getCountValues(uniqCounts);
  return createLinkedList(counts);
}

// Test cases
console.log(getCountValues({ 1: 2, 2: 2, 3: 1, }));
console.log(findUniqCounts(createLinkedList([1, 1, 2, 2, 3])));
console.log(testFrequencyList([1, 1, 2, 1, 3], [3, 1, 1]));
console.log(testFrequencyList([1, 1, 2, 2, 2], [2, 3]));
console.log(testFrequencyList([6, 5, 4, 3, 2, 1], [1, 1, 1, 1, 1, 1]));
console.log(testFrequencyList([4, 4, 4, 4], [4]));
console.log(testFrequencyList([1, 2, 3, 4, 5], [1, 1, 1, 1, 1]));
console.log(testFrequencyList([], []));
console.log(testFrequencyList([1, 1, 1], [3]));
console.log(testFrequencyList([1, 2, 1, 2, 1, 2], [3, 3]));
// All test cases should log true.