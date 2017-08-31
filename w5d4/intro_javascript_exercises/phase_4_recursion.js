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
