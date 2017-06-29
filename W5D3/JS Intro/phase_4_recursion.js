const range = function (start, end) {
  if (start === end) {
    return [];
  } else {
    return [start].concat(range(start+1, end));
  }
};

const exponent = function (base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp < 0) {
    return 1 / exponent(base, -exp);
  } else if (exp === 1){
    return base;
  }
  if (exp % 2 === 0) {
    return exponent(base * base, exp / 2);
  } else {
    return base * exponent(base * base, (exp - 1) / 2);
  }
};

const bsearch = function (sorted, target) {
  return bsearchHelper(sorted, target, 0, sorted.length - 1);
};

const bsearchHelper = function (sorted, target, start, end) {
  if (start > end) { return -1; }
  let mid = (start + end) / 2;
  if (sorted[mid] === target) {
    return mid;
  } else if (sorted[mid] < target) {
    return bsearchHelper(sorted, target, mid + 1, end);
  } else {
    return bsearchHelper(sorted, target, start, mid - 1);
  }
};

const mergesort = function (arr) {
  if (arr.length <= 1) { return arr; }
  let mid = arr.length / 2;
  let left = mergesort(arr.slice(0, mid));
  let right = mergesort(arr.slice(mid));
  return merge(left, right);
};

const merge = function (left, right) {
  let merged = [];
  while (left.length !== 0 && right.length !== 0) {
    let nextItem = (left[0] <= right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }
  return merged.concat(left, right);
};

const subsets = function (arr) {
  if (arr.length === 0) { return [[]]; }
  let last = arr[arr.length-1];
  let sub = subsets(arr.slice(0, -1));
  return sub.map(s => s.concat([last])).concat(sub);
};

const list = [1,2,3,4,5];
const shuffled = [5,4,3,2,1];
