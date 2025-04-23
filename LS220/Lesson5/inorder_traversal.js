// Given the root node of a binary tree, implement a
// function `inorderTraversal` that returns an
// array containing the values of the nodes visited in
// an inorder traversal.

// Your task is to implement the function iteratively using a stack.

/*
--- Problem
Input: root node of binary tree
Output: array of node values

  Rules:
  - Implement function solution iteratively using a stack
    - cant use recursion
  - obtain values in an inorder traversal
    - LNR
      - look down left side
        - push that value
      - check the right side

Assumptions:
- Assume arg will always be a binary tree or an empty tree (null)
- I wont be additional be given arguments

--- Examples
- Given [1, null, 2, 3] -> [1, 3, 2]
          1
           \
            2
           /
          3
  - inorder traversal LNR
    - [1]
    - 2 -> 3
      - process current node (3)
    - [ 1, 3]
    - process current node (2)
      - [1, 3, 2]

- Given [10, 5, 15, null, 6, 12, 21, null, null, 11] -> return [5, 6, 10, 11, 12, 15, 21]

              10
             /. \
           5.    15
            \    / \
             6  12 21
               /
              11
  - LNR , results= [], stack = [root]
  - start 10
  - add left child and then right child to stack -> stack = [5, 15]
    - move to 5
      - move right child -> stack = [15, 6]
    - check 5's left
      - left is empty, move back to previous node
    - process 5 -> results = [5]
    - check 5's right child
      - now at 6
      - check left, which is empty
      - move back to 6, process -> results = [5, 6]
      - check right, which is empty 
    - move to the next node in stack 15
      - move left and child to stack -> stack = [6, 12, 21]
      - results = [5, 6]
    - at root node (10)
      - i've processed my left side, now i process the node itself
      - results -> [5, 6, 10]
    - results = [5, 6, 10, 11]
    - results = [5, 6, 10, 11, 12]
    - results = [5, 6, 10, 11, 12, 15]
    - results = [5, 6, 10, 11, 12, 15, 21]
    - results = [5, 6, 10, 11, 12, 15, 21] === [5, 6, 10, 11, 12, 15, 21]
    
--- DS
- given tree 
- inorder traversal
- cant use recursion, have to a stack
- use ana rray implement the stack
- using a stack where i traverse each Node once
  - time complex O(N)
  - space complex O(h) - height of tree


 **** We need to add a variable we'll call curr to keep track of the current node. Before going to the left, we want to push the node onto the stack and move curr to the left as much as possible, which means continuing while a left node exists. ****

--- Algorithm
1. Set results to an empty array to hold all our node values
2. If root is null then return results
3. Set my stack to an empty array, to track which node to work once
4. Set curr = root

4. Traverse my tree in an inorderTraversal fashion, add the values to my results
- while my stack is not empty or curr is not null
  - while curr.left exists
    - push curr to stack
    - if curr.left exists
      - reassign curr to curr.left
    - if curr.left does not exist, this means we have travelled as far left as possible, thus we push the current node val into results
      - push curr.val into results

- push right child if it exists onto stack
- 


5. Return my results


- Given [10, 5, 15, null, 6, 12, 21, null, null, 11] -> return [5, 6, 10, 11, 12, 15, 21]

              10
            /    \
           5      15
            \    / \
             6  12 21
               /
              11

  stack = [], results = [], curr = root (10)


- Given [1, null, 2, 3] -> [1, 3, 2]
        1
    nl     2
          3
- curr = 1 stack = [] results = []
   while (curr) // curr is truthy at 1
    push curr = 1 into the stack
    reassign curr to curr.left
    stack = [1]
    curr = curr.left -> null
  - curr is null so we stop the inner loop
  curr = stack.pop -> 1
  curr = 1, stack []
  results = curr.value 
    results = [1], stack = [], curr = 1
  curr = curr.right (2)
  curr = 2, results = [1], stack = [],
-- next iteraiton
  - curr is thruthy so execute inner loop
    - push curr ( 2) into stack
    - curr = curr.left ( 3)
    -> stack = [2], curr = 3
  - curr is truthy(3)
    - push curr (3) into stack
    - curr = curr.left -> null
    - stack [ 2, 3], curr = null
  - exit inner loop since curr falsy

  curr = stack.pop-> 3
  curr = 3, stack = [2]
  results = curr.val -> [1, 3]
  curr = curr.right -> null
  -> curr = null, stack = [2], res = [1, 3]
-- next iteraiton
  - curr = null, skip inner loop
  - curr = stack.pop -> 2
  - res = curr.val -> [1, 3, 2]
  - stack = []
  - curr = null
-- end iteration since stack is now empty
- return res -> [1, 3, 2];

*/

function inorderTraversal(root) {
  let results = [];
  if (root === null) return results;
  let stack = [];
  let curr = root;

    while (stack.length > 0 || curr !== null) {
      while (curr) { // execute inner loop while curNode is not null
        stack.push(curr); // push the curr node into the stack for processing later
        curr = curr.left; // slide the currNode to the next left child OR null
    }

    curr = stack.pop();  // reassign curr to the next node that needs to be processed
    results.push(curr.val); // at this point we've reached left most part, so now we enter the 'N' in 'LNR' -- process the current node
    curr = curr.right; // slide curr to right node, it either exists or doesn't exist (null)

    // finally we end the while loop only if the stack has been processed or curr is not null
    // which may occur in the beginning when the stack is empty and curr is assigned to root
  }

  return results;
}

class Node {
  constructor(value) {
    this.val = value;
    this.left = null;
    this.right = null;
  }
}

// Helper function for test cases
function buildTree(arr) {
  if (arr.length === 0) {
    return null;
  }

  const nodes = [];

  const val = arr.shift();
  const root = new Node(val);
  nodes.push(root);

  while (arr.length > 0) {
    const curr = nodes.shift();

    const leftVal = arr.shift();
    if (leftVal !== null) {
      curr.left = new Node(leftVal);
      nodes.push(curr.left);
    }

    if (arr.length > 0) {
      const rightVal = arr.shift();
      if (rightVal !== null) {
        curr.right = new Node(rightVal);
        nodes.push(curr.right);
      }
    }
  }

  return root;
}

// Test Cases:

const tree1 = buildTree([1, null, 2, 3]);
console.log(inorderTraversal(tree1)); // Output: [1, 3, 2]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(inorderTraversal(tree2)); // Output: [2, 1, 4, 5, 3]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(inorderTraversal(tree3)); // Output: [1, 2, 3, 5]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(inorderTraversal(tree4)); // Output: [5, 6, 10, 11, 12, 15, 21]