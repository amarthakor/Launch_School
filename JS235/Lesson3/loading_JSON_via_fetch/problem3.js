/*

Write some JavaScript to create a new product by sending a request to the JSON API on our web store. To create a product, make a POST request to https://ls-230-web-store-demo.herokuapp.com/v1/products. To make the post request, you'll need the following:

Content-Type header set to application/json; charset=utf-8
Authorization header set to token AUTH_TOKEN
json object with the following properties:
name
sku (must have 3 or more characters)
price (must be an integer greater than 0)

*/

async function createNewProduct() {
  let data = { name: 'snowboard', sku: 'shred400', price: '420' };
  let json = JSON.stringify(data);

  let response = await fetch('https://ls-230-web-store-demo.herokuapp.com/v1/products', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'token AUTH_TOKEN',
    },
    body: json,
  });

  if (response.status === 201) {
    console.log(`This book was added to the catalog: ${await response.text()}`);
  }
}

createNewProduct();