console.log("connected");
//
// Back to the world of Javascript! See if you can remember how it works...
//
// Write a program that can calculate the sum of the first n elements of the following sequences:
//
// s1 = 1 - 1 + 1 - 1 + 1 - 1 + //etc
// s2 = 1 + 2 + 3 + 4 + 5 + 6 + //etc
// For example:
//
// s1(4) = 0
// s2(4) = 10
// Use any language of your choice.
//
// Can you guess what the sum would be if n is infinity?
//
// 0 4 8 12 16
// 1 2 3 4 5

const s1 = "1 - 1 + 1 - 1 + 1 - 1 +"//etc"
const s2 = "1 + 2 + 3 + 4 + 5 + 6 +"
let sum = 0
let operator = ""

// function summer (numString, n) {
//   // console.log(numString);
//   // console.log(n);
//   let arrString = numString.split(" ")
//   //console.log(arrString);
//   for (var i = 0; i < n * 2; i = i + 2) {
//     console.log(arrString[i]);
//     console.log(arrString[i + 1]);
//     const num = arrString[i]
//   }
//
// }

function summer (numString, n) {
  console.log(numString.slice(-1));
  let numPos = ((n-1) * 4) + 1
  let trimString = numString.substring(0, numPos);
  // console.log(trimString);
  console.log(eval(trimString));

}


summer (s1, 4)
summer (s2, 4)


summer (s1, 1)
summer (s2, 1)
