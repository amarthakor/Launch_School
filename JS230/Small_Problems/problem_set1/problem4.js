
/*

The end index doesn't have to be the id of the "innermost" child node as some of the examples suggest.


--- Problem
- Create a custom 'slice' method for the DOM
- Two arguments
  - 1: the start index which is the parent node's id attribute
  - 2: the end index which is the innermost child node's id attribute.
-> Return:
  - an array of elements, eles = tagNames

  Rules:
  - Similar to slice, but inclusive on 2nd argument
    # slice(0, 3) = [1, 2, 3] length is 3
    # treeSlice(0, 3) = [1, 2, 3, 4] length is 4 not 3
  - only consider elements nodes
  - only working with descendants of body element
  - if our '#id' attribute doesn't exist
    - return undefined;
  - if start > end
    - this is an invalid condition, return undefined FOR THE MOMENT
  - if the end node is not a descendant of the start node, then we dont a feasible pathway and therefore returned undefine
    - use .contains to check if end element is a descendant of my start element
      - if its not, return undefined

  - first I need to track how many descendants i've visited and stop collecting tagnames once i've hit the target amount
    - for loop to select elements
    - use a var to track the current start part
    - reassign it to its descendent each loop

  - figure out a way to travel from start -> end without selecting sibling elements and going off the wrong DOM branch

  - base case: if my current nodes id attribute matches the end attribute 
    - then return early
  - create an array of tagNames
  - starting my start node, ill push in its tagname into my holding array
  - loop thru each of the parent nodes children
    - check if current node is an ancestor of my end node
      - if it is
        - invoke my recursive call
      -if it isnt
        - move onto the next child
  -return my array of tagNames

sliceTree(1, 4);
= ["ARTICLE", "HEADER", "SPAN", "A"]
sliceTree(1, 76);
= undefined
sliceTree(2, 5);
= undefined
sliceTree(5, 4);
= undefined
sliceTree(1, 23);
= ["ARTICLE", "FOOTER"]
sliceTree(1, 22);
= ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
sliceTree(11, 19);
= ["SECTION", "P", "SPAN", "STRONG", "A"]

  - base case: if my current nodes id attribute matches the end attribute 
    - then return early
  - create an array of tagNames
  - starting my start node, ill push in its tagname into my holding array
  - loop thru each of the parent nodes children
    - check if current node is an ancestor of my end node
      - if it is
        - invoke my recursive call
      -if it isnt
        - move onto the next child
  -return my array of tagNames
*/

document.addEventListener('DOMContentLoaded', () => {
  function sliceTree(start, end) {
    // let startNode = document.getElementById(`${start}`);
    // let endNode = document.getElementById(`${end}`);
    // if (start > end) return undefined;
    // if (!startNode || !endNode) return undefined;
    // if (!startNode.contains(endNode)) return undefined;
    // let tagNames = [];
    // tagNames.push(endNode.tagName);

    // function selectNode() {
    //   if (endNode.id === start) return tagNames;
    //   endNode = endNode.parentElement;
    //   let tagName = sliceTree(start, endNode.id);
    //   if (tagName) {
    //     tagNames = tagNames.concat(tagName);
    //   }
    //   return tagName;
    // }

    // selectNode();
    // return tagNames;
      let startNode = document.getElementById(`${start}`);
  let endNode = document.getElementById(`${end}`);

  if (start > end) return undefined;
  if (!startNode || !endNode) return undefined;
  if (!startNode.contains(endNode) && startNode !== endNode) return undefined;

  if (startNode === endNode) return [startNode.tagName];

  let parentResult = sliceTree(start, endNode.parentElement.id);
  if (parentResult) {
    parentResult.push(endNode.tagName);
    return parentResult;
  }

  return undefined;
  }
  console.log(sliceTree(1, 4));
// = ["ARTICLE", "HEADER", "SPAN", "A"]
// console.log(sliceTree(1, 76));
// = undefined
// console.log(sliceTree(2, 5));
// = undefined
// console.log(sliceTree(5, 4));
// = undefined
console.log(sliceTree(1, 23));
// = ["ARTICLE", "FOOTER"]
console.log(sliceTree(1, 22));
// = ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(11, 19));
// = ["SECTION", "P", "SPAN", "STRONG", "A"]
});

