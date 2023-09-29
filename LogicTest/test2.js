function transpose(matrix) {
  const result = matrix[0].map((col, i) => matrix.map((row, j) => row[i]));
  return result;
}

const numbers = [
  [1, 2, 3],
  [4, 5, 6],
];

console.log(transpose(numbers));
