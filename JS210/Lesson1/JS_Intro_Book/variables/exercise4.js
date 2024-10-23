// What happens when you run the following code? Why?

// const NAME = 'Victor';
// console.log('Good Morning, ' + NAME);
// console.log('Good Afternoon, ' + NAME);
// console.log('Good Evening, ' + NAME);

// NAME = 'Joe';
// console.log('Good Morning, ' + NAME);
// console.log('Good Afternoon, ' + NAME);
// console.log('Good Evening, ' + NAME);

// Prints the first three console.logs with Victor, but incurs an error on 
// reassignment of NAME because constants cannot be reassigned after
// being defined. Either a new const or a regular variable must be used
// where the regular variable 'name' can be reassigned, whereas
// 'NAME' cannot.
