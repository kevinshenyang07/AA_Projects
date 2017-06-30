const readline = require('readline');

const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)
  input: process.stdin,
  output: process.stdout
});

function absurdBubbleSort(arr, sortCompletionCallback) {

  function outerBubbleSortLoop(madeAnySwaps) {
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      reader.close();
      return;
    }
    // outerBubbleSortLoop(madeAnySwaps);
  }

  innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);

}

function askIfGreaterThan(el1, el2, callback) {

  reader.question(`is ${el1} greater than ${el2} ?`, (res) => {
    if (res === "yes") {
      callback(true);
    } else {
      callback(false);
    }
  });

}
//
// askIfGreaterThan(1, 5, console.log) ;
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {

  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i+1], (result) => {
      if (result) {
        let temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
        madeAnySwaps = true;
      }
      console.log(arr);
      innerBubbleSortLoop(arr, i+1, madeAnySwaps, outerBubbleSortLoop);
    });
  } else {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }
}
absurdBubbleSort([3,2,1,4,5], console.log('yes'));
// innerBubbleSortLoop([3,5,1,1,5], 0, false, console.log('hello'));
