function sum(num) {
  if (num === 0) {
    return 1;
  } else {
    return num * sum(--num);
  }
}

const result = sum(5);
console.log(result);
