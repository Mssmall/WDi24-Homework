console.log("sieve2");

let maxNum = 120
let range = []
for (var i =0; i <= maxNum; i++) {
  range[i] = i+2;
}
primes = [];


// primes = range.filter(function (num) {
//   return num < 10
// })
//


//
// console.log(maxNum);
// console.log(range);
// console.log(primes);


// //this is josh's method
// while (range.length > 0) { // woirk with range
//
//   let nextPrime = range.shift() // pulls first number off the array. It will be a prime
//   primes.push(nextPrime)
//
//   range = range.filter (function (num) { //destructive filter of array range
//     return ((num % nextPrime) !== 0) // num is the next number in the array. if
//                                      // it's neatly divisible by nextPrime, then num is not prime.
//   })
//
// }
while (range.length > 0) {

  //get the first number. sperate it from ranger and it to primes
  let nextPrime = range.shift()
  primes.push(nextPrime)

  range = range.filter (function (num) {
    return (num % nextPrime !== 0)
  })




}
