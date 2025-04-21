// Given the root node of a binary tree, implement a
// function `preorderTraversal` that returns an
// array containing the values of the nodes visited in
// a preorder traversal.

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

/*
- return ana rray of node alues visited in preorder traversal
- what is preorder traversal?
  - NLR, process the node then check for left node ( if exists go down the left node)
    if not go down right node
  - do this until last node is reached, then climb back up
- check node value
- check if left node exists
  - if it does, go down left node
  - else check if left node exists
- if no child nodes exist, climb back up
- repeat process until head node is fully processed

--- Examples
- tree = [1, null, 2, 3] -> output [1, 2, 3]
  - head node is 1
    - next value is null, which represents left child node
    - left child node doesnt exist
  - check right child
    - value exists at right child -> process it and push 2 to the array
    - check left node
      - value exists at 3 -> process it and push 3 to the array
    - nothing exists on right child
    - climb back up
  - done processing tree

      1
 null   2
       3  
  -> [1, 2, 3]

  - using recursion
    - what is our base case?
      base case occurs when node === null
      - we return the fn to prevent accessing null.val which would raise an error

  - recursive definition
    - process the current node (add its val to the array)
    - recursively check the current childs left nodes
    - recursively check the current childs right nodes
- tree = [10, 5, 15, null, 6, 12, 21, null, null, 11] -> 
          10
          /  \
         5    15
          \   / \
           6 12  21
             /
            11
  -> [10, 5, 6, 15, 12, 11, 21]

--- algorithm
1. Return [] if given an empty tree
2. Create an empty storage array
3. Traverse the current node and add its values following NLR
- Create helper func that takes the current node
  - If the current node is null
    - return early
  - Push the current val into the storage array (step N in NLR)
  - traverse the left node  - recursively
  - traverse the right node - recursively
4. Return the storage array
*/

function preorderTraversal(root) {
  let values = [];

  function traverse(node) {
    if (node === null) return;
    values.push(node.val);
    traverse(node.left);
    traverse(node.right);
  }

  traverse(root);
  return values;
}
// Test Cases:

const tree1 = buildTree([1, null, 2, 3]);
console.log(preorderTraversal(tree1)); // Output: [1, 2, 3]

const tree2 = buildTree([1, 2, 3, null, null, 4, null, null, 5]);
console.log(preorderTraversal(tree2)); // Output: [1, 2, 3, 4, 5]

const tree3 = buildTree([5, 3, null, 2, null, 1, null]);
console.log(preorderTraversal(tree3)); // Output: [5, 3, 2, 1]

const tree4 = buildTree([10, 5, 15, null, 6, 12, 21, null, null, 11]);
console.log(preorderTraversal(tree4)); // Output: [10, 5, 6, 15, 12, 11, 21]