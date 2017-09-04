const Asteroid = require('./asteroid');

const Game = function Game(){
  this.asteroids = [];
  this.addAsteroids();
  this.image = document.getElementById("background");
};

Game.DIM_X = 1200;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;

Game.prototype.randomPosition = function () {
  // return [
  //   Math.floor(Math.random() * Game.DIM_X),
  //   Math.floor(Math.random() * Game.DIM_Y)
  // ];
  if (Math.random() < 0.5){
    return [
      Math.floor(Math.random() * Game.DIM_X),
      Math.random() < 0.5 ? 0 : Game.DIM_Y
    ];
  }else{
    return [
      Math.random() < 0.5 ? 0 : Game.DIM_X,
      Math.floor(Math.random() * Game.DIM_Y)
    ];
  }
};

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.drawImage(this.image, 0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach(function(a){ a.draw(ctx); });
};

Game.prototype.moveObjects = function (){
  this.asteroids.forEach(el => el.move());
  this.prune();
  this.addAsteroids();
};

Game.prototype.prune = function (){
  this.asteroids = this.asteroids.filter(asteroid =>
    asteroid.pos[0] >= 0 - Asteroid.RADIUS &&
    asteroid.pos[1] >= 0 - Asteroid.RADIUS &&
    asteroid.pos[0] <= Game.DIM_X + Asteroid.RADIUS &&
    asteroid.pos[1] <= Game.DIM_Y + Asteroid.RADIUS
  );
};

Game.prototype.addAsteroids = function () {
  while(this.asteroids.length < Game.NUM_ASTEROIDS){
    this.asteroids.push(new Asteroid({ pos: this.randomPosition() }));
  }
};

module.exports = Game;
