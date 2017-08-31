Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
  // return this;
};

Array.prototype.myMap = function(callback) {
  let map = [];
  for (let i = 0; i < this.length; i++) {
    map.push(callback(this[i]));
  }
  return map;
};

Array.prototype.myReduce = function(callback, initialValue) {
  let acc = "";
  if (initialValue === undefined){
    acc = this.shift();
  }else {
    acc = initialValue;
  }

  this.myEach(el => {
    acc = callback(acc, el);
  });

  return acc;
};
