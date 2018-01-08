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



const catTimerDone = window.setInterval(catWalk, 16);
