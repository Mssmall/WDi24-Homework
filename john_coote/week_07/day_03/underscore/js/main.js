
const bros = "Groucho Harpo Chgico".split(" ");

_(bros).forEach(function(b) {
  console.log(b.toUpperCase());
})

bros.forEach(function (b) {
  console.log(b);
})

const groucho = {
  name: "broucho",
  instrument: "guitar",
  vuce: "cigar"
};

_(groucho).forEach(function (value, key) {
  console.log(key, value);
})


const little = [1, 2, 3, 4, 5]
const squares = _(little).map(function (n) {
  return (n ** 2)
})
