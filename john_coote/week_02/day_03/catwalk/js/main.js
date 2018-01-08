console.log("catgif evening");



const catgif = document.querySelector('img');
console.log(catgif);
catgif.style.position = 'absolute';
catgif.style.left = '0px';
catgif.style.top = "300px";
let newLeft = 0;
let oldLeft = 0;
let oldTop = 0;
let newTop = 0;
blDirectionX = true;
blDirectionY = true;

const sungif = document.querySelectorAll('img')[1];
console.log(sungif);
sungif.style.width = "150px";
sungif.style.position = "absolute";
sungif.style.left = "0px";
sungif.style.top = "0px";
sunOldTop = 0;
sunNewTop = 0;
sunOldLeft = 0;
sunNewLeft = 0;
blSunDirectionX = true;
blSunDirectionY = true;
let a = 0;


let centreX = 500;
let centreY = 400;


// const sky = document.body.bgColor
// console.log(sky);
// //sky = "#0061FF"
document.body.bgColor = "#5090FF"
// const sky = document.body.bgColor
// console.log("sky",sky);

let screenWidth = 1400; //lookup . .  later



let j = 0;

console.log("one");

const catWalk = function() {
  oldLeft = parseInt(catgif.style.left);
  oldTop = parseInt(catgif.style.top);
  console.log(blDirectionX);
  console.log(blDirectionY);


  if (newLeft > 1000) {blDirectionX = false}
  if (newLeft < 0) {blDirectionX = true}

  if (blDirectionX === true) {newLeft = oldLeft + 2}
  if (blDirectionX === false) {newLeft = oldLeft - 2}
  // bigger = faster & jumpy, smaller = slow & smmoth

  if (newTop > 800) {blDirectionY = false}
  if (newTop < 0) {blDirectionY = true}
  if (blDirectionY === true) {newTop = oldTop + 2}
  if (blDirectionY === false) {newTop = oldTop - 2}

  catgif.style.left = newLeft + 'px'
  catgif.style.top = newTop + 'px'

  console.log(newLeft);
  console.log(newTop);




  if (newLeft > 5000) {
    clearInterval(catTimerDone);
    console.log("cat has left the building");
  }

}

console.log("two");

const sunFall = function() {
  sunOldTop = parseInt(sungif.style.top);
  sunNewTop = sunOldTop + 1;
  sunOldLeft = parseInt(sungif.style.left);
  sunNewLeft = sunOldLeft + 2
  sungif.style.top = sunNewTop + 'px';
  sungif.style.left = sunNewLeft + 'px';
  if (sunNewTop > 1000) {
    clearInterval(sunTimerDone);
    console.log("end the sun");
  }
}



const sunRotate = function() {

  // Rotation needs x and y to change direction when they reach the end, same as the cat.
  // first define a centre point (global) (centreX = 500, centreY = 400)
  // it is position relative to the centre that will change direction.
  //
  // sunOldTop = parseInt(sungif.style.top);
  // sunOldLeft = parseInt(sungif.style.left);
  //
  // x = sunOldLeft + 500;
  // y = sunOldTop + 400;
  //
  // delY =
  //
  // // if (newLeft > 1000) {blDirectionX = false}
  // // if (newLeft < 0) {blDirectionX = true}
  //
  //
  // sunNewTop = sunOldTop + 1;
  //
  // sunNewLeft = sunOldLeft + 2
  // sungif.style.top = sunNewTop + 'px';
  // sungif.style.left = sunNewLeft + 'px';
  // if (sunNewTop > 1000) {
  //   clearInterval(sunTimerDone);
  //   console.log("end the sun");
  // }
  a = a + 0.005 // simulates time
  let x1 = window.innerHeight / 2
  //window.innerWidth / 3
  let y1 = window.innerHeight / 2

  x = x1 * (Math.cos(a))
  console.log(x);

  y = y1 * (Math.sin(a))
  console.log(y);


  x = x + x1;
  y = y + x1;

  sungif.style.top = x + 'px';
  sungif.style.left = y + 'px';


  // still need to accomodate top / left to centre. next time...
}


const skyDarken = function() {
  // document.body.bgColor = "#0061FF"
  let skyOld = document.body.bgColor
  let sky1Hex = skyOld.slice(1, 3)
  let sky2Hex = skyOld.slice(3, 5)
  let sky3Hex = skyOld.slice(5, 7)
  let sky1Dec = parseInt(sky1Hex, 16)
  let sky2Dec = parseInt(sky2Hex, 16)
  let sky3Dec = parseInt(sky3Hex, 16)
  sky1Dec = sky1Dec - 1; //////////////////////////////////////
  if (sky1Dec < 0) {
    sky1Dec = 0
  };
  sky2Dec = sky2Dec - 2; //////////////////////////////////////
  if (sky2Dec < 0) {
    sky2Dec = 0
  };
  sky3Dec = sky3Dec - 4; //////////////////////////////////////
  if (sky3Dec < 0) {
    sky3Dec = 0
  };
  sky1Hex = sky1Dec.toString(16);
  if (sky1Hex === "0") {
    sky1Hex = "00"
  }
  if (sky1Hex.length === 1) {
    sky1Hex = sky1Hex + sky1Hex
  }
  sky2Hex = sky2Dec.toString(16);
  if (sky2Hex === "0") {
    sky2Hex = "00"
  }
  if (sky2Hex.length === 1) {
    sky2Hex = sky2Hex + sky2Hex
  }
  sky3Hex = sky3Dec.toString(16);
  if (sky3Hex === "0") {
    sky3Hex = "00"
  }
  if (sky3Hex.length === 1) {
    sky3Hex = sky3Hex + sky3Hex
  }
  let skyNew = "#" + sky1Hex + sky2Hex + sky3Hex;
  document.body.bgColor = skyNew;
  console.log("sky", skyNew);
  j = j + 1;
  if (j > 58) {
    clearInterval(skyTimerDone);
    console.log("THe sky has fallen");
  }

}



const catTimerDone = window.setInterval(catWalk, 16);
//const sunTimeDone = window.setInterval(sunRotate, 10);

const sunTimerDone = window.setInterval(sunFall, 16);
const skyTimerDone = window.setInterval(skyDarken, 200);




// const dogTimerDone = window.setInterval(dogWalk, 500);
