// An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).
//
// The list of items (and their value) that were tested are:
//
// eggs (1)
// peanuts (2)
// shellfish (4)
// strawberries (8)
// tomatoes (16)
// chocolate (32)
// pollen (64)
// cats (128)
// So if Tom is allergic to peanuts and chocolate, he gets a score of 34.
//
// Now, given just that score of 34, your program should be able to say:
//
// Whether Tom is allergic to any one of those allergens listed above.
// All the allergens Tom is allergic to.

console.log("connected!");

let allergies = {
  eggs: false,
  peanuts: false,
  shellfish: false,
  strawberries: false,
  tomatoes: false,
  choclate: false,
  pollen: false,
  cats: false
}

firstPass = function (score) {


  if (score >= 128) {
    score = score - 128;
    allergies.cats = true;
    console.log("cats");
  }

  if (score >= 64) {
    score = score - 64;
    allergies.pollen = true
    console.log("pollen");
  }

  if (score >= 32) {
    score = score - 32;
    allergies.choclate = true
    console.log("choclate");
  }

  if (score >= 16) {
    score = score - 16;
    allergies.tomatoes = true
    console.log("tomatoes");
  }

  if (score >= 8) {
    score = score - 8;
    allergies.strawberries =
    console.log("strawberries");
  }

  if (score >= 4) {
    score = score - 4;
    allergies.shellfish = true
    console.log("shellfish");
  }

  if (score >= 2) {
    score = score - 2;
    allergies.peanuts = true
    console.log("peanuts");
  }

  if (score >= 1) {
    score = score - 1;
    allergies.eggs = true
    console.log("eggs");
  }


  console.log(score);
  console.log(allergies);

}


secondPass = function (score) {

  for (var i = Object.keys(allergies).length; i > 0; i--) {
    if (score > 2**(i-1)) {
      console.log("JDJDJ");
      Object.values(allergies)[i] = true;
      console.log(Object.keys(allergies)[i], Object.values(allergies)[i]);
      score = score - (2**(i-1))
    }
    console.log(Object.keys(allergies)[i], Object.values(allergies)[i]);
  }

  console.log(allergies);
  console.log(score);

}

//firstPass(34)

secondPass(34)
