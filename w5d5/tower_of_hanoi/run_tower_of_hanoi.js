const Game = require("./game_logic.js");
const game = new Game();

class TowerOfHanoi {
  run(){
    // until the start stack is empty and another stack is full
    while (!game.isWon()){
      //get move from current user
      game.promptMove();
    }

    console.log("Congrats! You have won!");
  }
}

const toh = new TowerOfHanoi();
toh.run();
