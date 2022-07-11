export function selection_sort(arr) {
  for (let i = 0; i < arr.length; i++) {
    let min = arr[i];
    let pos = i;
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[j] < min) {
        min = arr[j];
        pos = j;
      }
    }
    if (min !== arr[i]) {
      temp = arr[pos];
      arr[pos] = arr[i];
      arr[i] = temp;
    }
  }
  return arr;
}

