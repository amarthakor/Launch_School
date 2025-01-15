// - must be 1 @sign
// - local part must contain ONE OR MORE letters and / or digits, NOTHING ELSE 
// - DOMAIN must contain TWO OR MORE parts, each separated by a '.'
//   - each component of the domain must contain ONLY ONE OR MORE letters

// first, check if the email has an '@'.
//  - if it does, split it into two variables by localpart and domain part
//  - if it doesnt, return false

// second, validate the localpart
//    - check if the local part contains ONLY 1 + letters and/or digits
//    - if it doesn't return false

// third, validate the domain part / top level domain
//    ** side note, if multiple back to back '.' this is not valid, figure out solution
//        -- split by '.' as planned, if empty strings in array, return false
//
//    - check if the domain part has AT LEAST 2 'parts' seaparted by a .
//      - if it doesnt, return false

//    - next check if all parts of the domain only include alphabetical letters
//      - if it doesnt, return false

// return


function isValidEmail(email) {
  if (email.replace(/[^@]/g, '').split('').length !== 1) return false;

  let localPart = email.split('@')[0];
  let domainPart = getDomainEmail(email);

  if (!validateLocalPart(localPart)) return false;
  if (!validateDomain(domainPart)) return false;
  return true;
}

function getDomainEmail(email) {
  let domainPart = email.split('@').slice(1)[0];
  return domainPart.split('.');
}

function validateLocalPart(localStr) {
  return (localStr.search(/[^a-z0-9]/i) === -1);
}

function validateDomain(domainArray) {
  if (domainArray.join('').search(/[^a-z]/i) !== -1) return false;
  return (!domainArray.includes('') && domainArray.length > 1)
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false