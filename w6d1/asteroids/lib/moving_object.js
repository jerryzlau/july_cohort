function MovingObject(attributes){
  this.pos = attributes["pos"];
  this.vel = attributes["vel"];
  this.radius = attributes["radius"];
  this.color = attributes["color"];
}

MovingObject.prototype.draw = function(ctx){
  ctx.beginPath();
  ctx.fillStyle = this.color;
  ctx.strokeStyle = "black";
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
  ctx.fill();
  ctx.stroke();
  return this;
};

MovingObject.prototype.move = function(){
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  return this;
};

module.exports = MovingObject;
