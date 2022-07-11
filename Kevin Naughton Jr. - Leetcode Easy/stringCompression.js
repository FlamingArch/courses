// Given an array of characters, compress it in-place.
//
// The length after compression must always be smaller than or equal to the original array.
//
// Every element of the array should be a character (not int) of length 1.
//
// After you're done modyfying the input array in-place, return the new length of the array.

// chars = "abbbbbaaavvv";  // Correct: 7
// chars = "abbbbbbbbbbbb"; // Correct: 4

let func = (chars) => {
  let index = 0;
  for (let i = 0; i < chars.length; i++) {
    let j = i;
    while (j < chars.length && chars[j] === chars[i]) {
      j++;
    }
    // console.log("j :>> ", j);
    chars[index++] = chars[i];
    if (j - i > 1) {
      for (const c in `${j - i}`) {
        // console.log("c :>> ", c);
        chars[index++] = c;
      }
    }
    i = j;
    // console.log("chars :>> ", chars);
  }
  return index;
};

console.log("func(chars) :>> ", func(chars));
