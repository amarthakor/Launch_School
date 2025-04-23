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
// Given the root node of a binary tree, implement a
// function `postorderTraversal` that returns an
// array containing the values of the nodes visited in
// an postorder traversal.

// Your task is to implement the function iteratively using a stack.
/*
--- Problem
Input: binary tree
Output: array of node values

  Rules:
    - Cant use recursion, must use a stack
    - Must obtain node values in postorder traversal
      - This means LRN processing

--- Examples
[1, null, 2, 3] -> return [3, 2, 1]
          1
            \
             2
            /
           3
  - start at root
  - check left empty
  - check right -> 2
  - check left of 2 -> 3
  - check left of 3 empty
  - check right of 3 empty
  - process 3 [3]
  - check right of 2 empty
  - process 2 [3, 2]
  - back at 1
  - process 1 [3, 2, 1]

[10, 5, 15, null, 6, 12, 21, null, null, 11] -> return [6, 5, 11, 12, 21, 15, 10]
              10
            /    \
           5      15
            \    / \
             6  12 21
               /
              11
  
--- DS
- given binary tree
- need to solve using stack data structure
- use arrays to implement stack DS

--- Algorithm
1. Handle null tree, create results array
2. Create traversalStack and processStack
3. Push root to traversalStack
4. Traverse tree while traversalStack is not empty
- while traversalStack is not empty
  - pop node from traversalStack and push to processStack
  - if popped node has left child, push it to traversalStack
  - if popped node has right child, push it to travStack
5. Process nodes in processStack
  - while processStack is not empty
  - pop node off procStack
  - push its value to results
6. Return results
*/


function postorderTraversal(root) {
  let results = [];
  if (root === null) return results;
  let [traversalStack, processStack] = [[root], []];
  
  while (traversalStack.length > 0) {
    let node = traversalStack.pop();
    processStack.push(node);
    if (node.left) traversalStack.push(node.left);
    if (node.right) traversalStack.push(node.right);
  }

  while (processStack.length > 0) {
    let node = processStack.pop();
    results.push(node.val);
  }

  return results;
}

// Test cases
const tree1 = buildTree([1, null, 2, 3]);
console.log(postorderTraversal(tree1)); // Output: [3, 2, 1]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(postorderTraversal(tree2)); // Output: [2, 5, 4, 3, 1]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(postorderTraversal(tree3)); // Output: [1, 2, 3, 5]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(postorderTraversal(tree4)); // Output: [6, 5, 11, 12, 21, 15, 10]