Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function (callback) {
  const mapped = [];
  this.myEach(el => mapped.push(callback(el)));
  return mapped;
};

Array.prototype.myReduce = function (callback, initVal) {
  let arr = this;
  if (!initVal) {
    initVal = arr[0];
    arr = arr.slice(1);
  }
  arr.myEach(function (el) {
    initVal = callback(initVal, el);
  });
  return initVal;
};

const nums = [1,2,3,4,5];
