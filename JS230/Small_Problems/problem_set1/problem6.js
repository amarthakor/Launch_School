/*
- take two args, both integers
  - args represent element ids that are strings
- swap the arg1 with arg2 in the html doc
- rules:
  - if arg1 or arg2 doesn't exist
    - reurend undefined
  - if either arg1 is a child of arg2 OR vice versa
    - cannot swap
    - i.e. they have to be apart of the same generation
  - Can swap nested elements as long as they are apart of different DOM branches (i.e. not ancestors / descendents)
    - i.e. can swap id=1 with id=7

- Select a div with id of node1
- Select a div with id of node2
- if any are null, return undefined

  - check if node 1 is a child of node 2 
  - check if node 2 is a child of node 1
    - if any are true, return early;
    - contains
- make a deep clone of node1
- make a deep clone of node2

- select the parent of node1
- select the parent of node2
  - .parentElement

- swap node2 with clonedNode1 via parent.replaceChild
- swap node1 with clonedNode2 via parent.replaceChild

*/

document.addEventListener('DOMContentLoaded', () => {
  function nodeSwap(n1, n2) {
    let node1 = document.getElementById(`${n1}`);
    let node2 = document.getElementById(`${n2}`);
    if (!node1 || !node2) return;
    if (node1.contains(node2) || node2.contains(node1)) return;

    let cloneNode1 = node1.cloneNode(true);
    let cloneNode2 = node2.cloneNode(true);

    let parentNode1 = node1.parentElement;
    let parentNode2 = node2.parentElement;

    parentNode1.replaceChild(cloneNode2, node1);
    parentNode2.replaceChild(cloneNode1, node2);

    return true;
  }

  nodeSwap(1, 24); // undefined
  // nodeSwap(7, 9); // true
  // nodeSwap(3, 1); // true
  // nodeSwap(1, 4); // undefined
  // nodeSwap(9, 3); // undefined
});