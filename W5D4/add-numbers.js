const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)
  input: process.stdin,
  output: process.stdout
});


const addNumbers = function (sum, numsLeft, completionCallback) {
  let i = 0;
  function loopStep () {
    if (i === numsLeft) {
      completionCallback(sum);
      return;
    }
    i++;
    reader.question("Enter a number\n", function (res) {
      sum += parseInt(res);
      // console.log(sum);
      loopStep();
    });
  }
  loopStep();
};

addNumbers(0, 3, function (sum) {
  console.log(`Total sum: ${sum}`);
  reader.close();
});
