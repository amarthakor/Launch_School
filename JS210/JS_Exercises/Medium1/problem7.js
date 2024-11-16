



function invoiceTotal(...args) {
  let allItems = args.length;
  let totalInvoice = 0;

  for (let idx = 0; idx < allItems; idx += 1) {
    totalInvoice += args[idx];
  }

  return totalInvoice;
}

console.log(invoiceTotal(20, 30, 40, 50));          // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40));  // does not work; how can you make it work?