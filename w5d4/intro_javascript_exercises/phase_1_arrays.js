Array.prototype.uniq = function(){
  let newArray = [];
  this.forEach(el => {
    if (!newArray.includes(el)){
      newArray.push(el);
    }
  });

  return newArray;
};

Array.prototype.twoSum = function(){
  let indices = [];
  for(var i = 0; i < this.length; i++){
    for(var j= i+1; j< this.length; j++){
      if (this[i] + this[j] === 0){
        indices.push([i,j]);
      }
    }
  }
  return indices;
};

Array.prototype.transpose = function(){
  let result = [];
  this[0].forEach(el => {
    result.push([]);
  });
  for(var i=0;i<this.length;i++){
    for(var j=0;j<this[0].length;j++){
      result[j][i] = this[i][j];
    }
  }
  return result;
};

console.log([1,2,3,4,-1].twoSum());