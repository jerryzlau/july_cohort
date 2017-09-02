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
    this.board = new Array([3,2,1],[],[]);
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if(!this.board[startTowerIdx] || !this.board[endTowerIdx]) {
      return false;
    }else if(this.board[endTowerIdx].last() < this.board[startTowerIdx].last()){
      return false;
    }else if (this.board[startTowerIdx].empty()){
      return false;
    }else {
      return true;
    }
  }

  move(startTowerIdx, endTowerIdx){
    if (this.isValidMove(startTowerIdx, endTowerIdx)){
      this.board[endTowerIdx].push(this.board[startTowerIdx].pop());
    }
    return this.isValidMove(startTowerIdx, endTowerIdx);
  }

  isWon(){
    let firstCheck = this.board[1] === [3,2,1];
    let secondCheck = this.board[2] === [3,2,1];
    if (this.board[0].empty() && (firstCheck || secondCheck)){
      return true;
    }
      return false;
  }
}

Game.prototype.promptMove = function () {
  console.log(this.board);
  reader.question('From which tower: ', (startTowerIdx) => {
    reader.question('To which towe: ', (endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)){
        console.log("Invalid move");
      }
      reader.close();
    });
    reader.close();
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
