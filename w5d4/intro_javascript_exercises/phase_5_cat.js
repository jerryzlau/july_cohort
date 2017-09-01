const Cat = function(name, owner){
  this.name = name;
  this.owner = owner;
};

Cat.prototype.cuteStatement = function cuteStatement(){
  console.log(`${this.owner} loves ${this.name}`);
};

Cat.prototype.cuteStatement = function cuteStatement(){
  console.log(`Everyone loves ${this.name}`);
};


Cat.prototype.meow = function meow() {
  console.log("Meow");
};

let kitty = new Cat("kitty", "jerry");
let sand = new Cat("sand", "jerry");
let wind = new Cat("wind", "jerry");
let fire = new Cat("fire", "jerry");
kitty.cuteStatement();

fire.meow = function meow() {
  console.log("Nyan");
};

kitty.meow();
fire.meow();
