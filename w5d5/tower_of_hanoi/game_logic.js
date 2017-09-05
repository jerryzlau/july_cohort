const readline = require('readline');

/* globals reader */
const reader = readline.createInterface({
  // it's okay if this part is magic; it just says that we want to
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)

  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor() {
    this.tower = new Array([3,2,1],[],[]);
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if(!this.tower[startTowerIdx].length === 0) {
      return false;
    }else if(this.tower[endTowerIdx].length == 0){
      return true;
    }else {
      return this.tower[startTowerIdx.length-1] < this.tower[endTowerIdx.length-1];
    }
  }

  move(startTowerIdx, endTowerIdx){
    if (this.isValidMove(startTowerIdx, endTowerIdx)){
      this.tower[endTowerIdx].push(this.tower[startTowerIdx].pop());
    }
    return this.isValidMove(startTowerIdx, endTowerIdx);
  }

  isWon(){
    let firstCheck = this.tower[1] === [3,2,1];
    let secondCheck = this.tower[2] === [3,2,1];
    if (this.tower[0].empty() && (firstCheck || secondCheck)){
      return true;
    }
      return false;
  }
}

Game.prototype.promptMove = function () {
  console.log(this.tower);
  reader.question('From which tower: ', (startTowerIdx) => {
      startTowerIdx = parseInt(startTowerIdx);
    reader.question('To which towe: ', (endTowerIdx) => {
      endTowerIdx = parseInt(endTowerIdx);
      if (!this.move(startTowerIdx, endTowerIdx)){
        console.log("Invalid move");
      }
      // reader.close();
    });
    // reader.close();
  });
};

Array.prototype.last = function (){
  return this[this.length-1];
};

Array.prototype.empty = function (){
  if (this.length === 0){
    return true;
  }else{
    return false;
  }
};

// const game = new Game();
// game.promptMove();

module.exports = Game;
