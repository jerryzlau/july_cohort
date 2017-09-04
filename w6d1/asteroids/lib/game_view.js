const Game = require("./game");

const GameView = function GameView(ctx){
  this.ctx = ctx;
  this.game = new Game();
};

GameView.prototype.start = function start(){
  // this.game.moveObjects();
  // this.game.draw();
  // window.requestAnimationFrame(this.start.bind(this));
  window.setInterval(function(){
    this.game.moveObjects();
    this.game.draw(this.ctx);
  }.bind(this), 20);
};

module.exports = GameView;
