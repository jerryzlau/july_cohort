function range(start, end) {
  if (end === start) {
    return [start];
  } else {
    return [start].concat(range(start + 1, end));
  }
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  } else {
    return arr.shift() + sumRec(arr);
  }
}

function exponent1(base, n) {
  if (n === 0) {
    return 1;
  } else {
    return base * exponent1(base, n-1);
   }
}

function exponent2(base, n) {
  if (n === 0) {
    return 1;
  } else if (n === 1) {
    return base;
  } else if (n%2 === 0) {
    return Math.pow((exponent2(base, n/2)), 2);
  } else {
    return (base * Math.pow((exponent2(base, (n - 1) / 2)), 2));
  }
}

function fibonacci(n){
  if (n === 1){
    return [0];
  }else if (n === 2) {
    return [0,1];
  }else {
    let fib = fibonacci(n-1);
    let nextFib = fib[fib.length-1] + fib[fib.length-2];
    return fib.concat(nextFib);
  }
}

function bSearch(array, target){
  if (array.length === 0) {
    return -1;
  } else {
    let mid = Math.floor(array.length/2);
    if (array[mid] === target){
      return mid;
    } else if (array[mid] < target) {
      let searchRes = bSearch(array.slice(mid+1), target);
      if (searchRes === -1){
        return -1;
      } else {
        return mid + 1 + searchRes;
      }
    }else{
      return bSearch(array.slice(0,mid), target);
    }
  }
}

function merge(left, right){
  let merged = [];

  while ((left.length !== 0) && (right.length !== 0)){
    switch (Math.sign(left[0] - right[0])){
      case -1:
        merged.push(left.shift());
        break;
      case 1:
        merged.push(right.shift());
        break;
      case 0:
        merged.push(left.shift());
        break;
    }
  }

  return merged.concat(left).concat(right);
}

function mergeSort(array){
  if (array.length <= 1) return array;
  let mid = Math.floor(array.length/2);
  let sorted_left = mergeSort(array.slice(0,mid));
  let sorted_right = mergeSort(array.slice(mid));

  return merge(sorted_left, sorted_right);

}

// console.log(mergeSort([3,2,7,4,8]));

function subsets(array){
  if (array.length === 0) return [[]];
  let subs = subsets(array.slice(0, array.length - 1));
  let result = subs.map( el => {
    return el.concat(array[array.length-1]);
  });

  return subs.concat(result);
}
