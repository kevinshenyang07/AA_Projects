const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor () {
    this.stack = [[1,2,3], [], []];

  }

  promptMove (callback) {
    console.log(this.stack);
    reader.question("Please enter a from and a to stack eg: 1,2\n", (res) => {
      let [from, to] = res.split(",");
      from = parseInt(from);
      to = parseInt(to);
      console.log(`you moved a disc from ${from} to ${to}`);
      if (this.isValidMove(from, to)) {
        this.stack[to].unshift(this.stack[from].shift());
        console.log(this.stack);
      }
      callback();
    });
  }

  isValidMove(from, to) {
    if ((0 < from < 3) && (0 < to < 3)) {
      if (this.stack[from].length !== 0 && ( this.stack[to].length === 0 || this.stack[from][0] < this.stack[to][0])) {
        return true;
      }
    }
    return false;
  }

  isWon() {
    let mid = JSON.stringify(this.stack[1]);
    let right = JSON.stringify(this.stack[2]);
    if (mid === '[1,2,3]' || right === '[1,2,3]') {
      return true;
    } else {
      return false;
    }
  }

  run(completionCallback) {
    // until inorder(mid) || inorder(right)
      // ask user from and to
      // move(from, to)
    let that = this;
    function loopStep() {
      if (that.isWon()) {
        completionCallback();
        return;
      }
      that.promptMove(loopStep);
    }
    loopStep();
  }
}

let game = new Game();

game.run(function () {
  console.log("You won!");
  reader.close();
});
