Array.prototype.uniq = function () {
  const uniqArr = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniqArr.includes(this[i])) {
      uniqArr.push(this[i]);
    }
  }
  return uniqArr;
};

Array.prototype.twoSum = function () {
  const pairs = [];
  const dict = {};
  for (let i = 0; i < this.length; i++) {
    let x = this[i];
    if (!(x in dict)) {
      dict[-x] = i;
    } else {
      pairs.push([dict[x], i]);
    }
  }
  return pairs;
};

Array.prototype.transpose = function () {
  const transposed = [];
  const rows = this.length;
  const cols = this[0].length;
  for (let c = 0; c < cols; c++) {
    let row = [];
    for (let r = 0; r < rows; r++) {
      row.push(this[r][c]);
    }
    transposed.push(row);
  }
  return transposed;
};

const arr1 = [1, 2, 2, 4, 6, 6];
const arr2 = [1, 0, -1, 2, -2];
const mat = [[1,2,3], [4,5,6]];
