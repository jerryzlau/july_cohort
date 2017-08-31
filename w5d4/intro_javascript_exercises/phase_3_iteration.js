Array.prototype.bubbleSort = function(){
  let i = 0;
  let array = [];
  while (i < this.length){
    let j = 0;
    this.forEach(el => {
      if (j+1 < this.length && this[j] > this[j+1]){
        let temp = this[j];
        this[j] = this[j+1];
        this[j+1] = temp;
      }
      j++;
    });
    i++;
  }
  return this;
};

String.prototype.substrings = function(){
  let result = [];
  for (let i = 0; i < this.length; i++){
    for(let j = i+1; j <= this.length; j++){
      result.push(this.substring(i,j));

    }
  }
  return result;
};
