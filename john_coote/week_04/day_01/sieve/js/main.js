console.log("day4.1");

// The algorithm consists of repeating the following over and over:
//
// take the next available unmarked number in your list (it is prime)
// remove all the multiples of that number (they are not prime)
// Repeat until you don't have any possible primes left in your range.



let range = []
for (var i = 0; i < 12; i++) {
  range[i] = true;
}
