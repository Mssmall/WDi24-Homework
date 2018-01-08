console.log("planets...");
// https://www.space.com/16080-solar-system-planets.html

///////// Constants
const windowHeight = window.innerHeight // approx 780
const windowWidth = window.innerWidth // approx 1400
const screenCentreX = windowWidth / 2
const screenCentreY = windowHeight / 2
// planets are 100 square, centre is 50 from top and left
// sun : 120 60/60, moon: 50 25/25

$('.textual').hide(); // hide the info divs



////// SANDBOX




/////////////////////////

let pie = Math.PI
let rateFactor =  0.005// this governs the smoothness. as I did the earth first if rateFactor = 2 * 3.14 the earth dont move. THis will change with the slider, but we need to declare the variable first.
let nearnessConstant = 80;
let speedConstant = 20 // runs the loops ever speeadConstant milliseconds. unfortunately changing this in the console doesnt change the speed on the page.
let earthTime = 0;
let mercuryTime = 0;
let venusTime = 0;
let marsTime = 0;
let jupiterTime = 0;
let saturnTime = 0;
let uranusTime = 0;
let neptuneTime = 0;
let cometTime = 0;
let blCatDirectionX = true;
let blCatDirectionY = true;
let catX = windowWidth -100;
let catY = windowHeight -100;
let a = 0;
let mercuryX = 0;
let mercuryY = 0;
let arr1 = []

$("#inputRange").on("change", function(){
  console.log(this.valueAsNumber)
  rateFactor = this.valueAsNumber / 1000;
});



const planets = {
  sol: {
    $img: $('img#sol'),
    name: "sol",
    info: "<p>The sun is very big and made of gas. One day it will explode and destroy any life that remains on earth, and what use will jQuery be then?</p><p>Sol Invictus (Unconquered Sun) was the official sun god of the later Roman Empire, until one of the Constantines put a stop to that.</p>",
    clicked: $('img#sol').on('click', function () { // this works
    displayInfo (planets.sol.info, planets.sol.name)
    })
  },
  mercury: {
    period: 88,
    orbitRadius: 50,
    name: "mercury",
    info: "<p>Mercury is the smallest planet and is named after Mercury the metal, which is the only metal to be liquid at room temperature.</p><p> It is gravitationally locked with the Sun and rotates in a way that is unique in the Solar System. As seen relative to the fixed stars, it rotates on its axis exactly three times for every two revolutions it makes around the Sun.</p>",
    img: $img = $('img#mercury'),
    orbit: function () {
      const a = planets.mercury.orbitRadius // orbit radius
      const b = planets.mercury.period
      mercuryTime = mercuryTime + (rateFactor * 365/b)
      mercuryX = (a * (Math.sin(mercuryTime)) + screenCentreX - 50);
      mercuryY = (a * (Math.cos(mercuryTime)) + screenCentreY - 50);

      planets.mercury.img.offset({left: mercuryX, top: mercuryY})

      updateYearsInfo(planets.mercury.name, mercuryTime)
    },
    clicked: $('img#mercury').on('click', function () { // this works
      displayInfo (planets.mercury.info, planets.mercury.name)
    })
  },
  venus: {
    period: 224,
    orbitRadius: 100,
    info: "<p>Apparently men are from mars and women are from venus. Which is weird, becuase the atmospheric pressure at the planet's surface is 92 times that of Earth, it has a mean surface temperature of 462 °C and is shrouded by an opaque layer of highly reflective clouds of sulfuric acid.</p> <p>Like Mercury, Venus feels sad to be known as an <strong>inferior planet</strong></p>",
    name: "venus",
    $img: $('img#venus'),
    orbit: function () {
      const a = planets.venus.orbitRadius // orbit radius
      const b = planets.venus.period
      //console.log(a);
      venusTime = venusTime + (rateFactor * 365/b)
      venusX = (a * (Math.sin(venusTime)) + screenCentreX - 50);
      venusY = (a * (Math.cos(venusTime)) + screenCentreY - 50);
      //console.log(mercuryX, mercuryY);
      planets.venus.$img.offset({left: venusX, top: venusY})

      updateYearsInfo (planets.venus.name, venusTime)
    },
    clicked: $('img#venus').on('click', function () { // this works
      displayInfo (planets.venus.info, planets.venus.name)
    })
  },
  earth: {
    period: 365,
    orbitRadius: 150,
    name: "earth",
    info: "<p>We all know about earth. We live here. The only planet to be home to <ul><li>the marx brothers</li><li>cats</li><li>java script</li></p>",
    moons: {luna: {period: 13, $img: $('img#luna')}},
    $img: $('img#earth'),
    orbit: function () {
      const a = planets.earth.orbitRadius // orbit radius
      const b = planets.earth.period
      const c = planets.earth.moons.luna.period
      //console.log(a);
      earthTime = earthTime + (rateFactor * 365/b)
      earthX = (a * (Math.sin(earthTime)) + screenCentreX - 50);
      earthY = (a * (Math.cos(earthTime)) + screenCentreY - 50);
      //console.log(earthX, earthY);
      planets.earth.$img.offset({left: earthX, top: earthY})

      lunaX = (50 * (Math.sin(earthTime * c)) + earthX + 25);
      lunaY = (50 * (Math.cos(earthTime * c)) + earthY + 25);
      planets.earth.moons.luna.$img.offset({left: lunaX, top:lunaY})

      updateYearsInfo (planets.earth.name, earthTime)
    },
    clicked: $('img#earth').on('click', function () { // this works
      displayInfo (planets.earth.info, planets.earth.name)
    })
  },
  mars: {
    period: 686,
    orbitRadius: 200,
    name: "mars",
    info: "<p>Mars is the god of war. The moons of mars are Phobos (fear) and Deimos (panic)</p><p>NASA sent a robot there. I think it;s name is Johnny 5. <a href=\"https://mars.nasa.gov/mer/home/?\" target=\"_blank\">click here for info</a></p>",
    moons: {
      deimos: {period: 2060, $img: $('img#deimos')},
      phobos: {period: 460, $img: $('img#phobos')},
    },
    $img: $('img#mars'),
    orbit: function () {
      const a = planets.mars.orbitRadius // orbit radius
      const b = planets.mars.period
      const c = planets.mars.moons.deimos.period / 20 // the 20 is just to slow things down
      const d = planets.mars.moons.phobos.period / 20 // the 20 is just to slow things down

      marsTime = marsTime + (rateFactor * 365/b)
      marsX = (a * (Math.sin(marsTime)) + screenCentreX - 50);
      marsY = (a * (Math.cos(marsTime)) + screenCentreY - 50);
      planets.mars.$img.offset({left: marsX, top: marsY})
      updateYearsInfo (planets.mars.name, marsTime);

      deimosX = (50 * (Math.sin(marsTime * c)) + marsX + 25);
      deimosY = (50 * (Math.cos(marsTime * c)) + marsY + 25);
      planets.mars.moons.deimos.$img.offset({left: deimosX, top:deimosY})

      phobosX = (50 * (Math.sin(marsTime * d)) + marsX + 25);
      phobosY = (50 * (Math.cos(marsTime * d)) + marsY + 25);
      planets.mars.moons.phobos.$img.offset({left: phobosX, top:phobosY})
    },
    clicked: $('img#mars').on('click', function () { // this works
      displayInfo (planets.mars.info, planets.mars.name)
    })
  },
  jupiter: {
    period: 4329,
    orbitRadius: 250,
    name: "jupiter",
    info: "<p>Jupiter is really big and it has a spot. The spot is like a hurricane which is more than twice the size of Earth</p><p>Jupiter has a bazillion moons and i have shown three of them here</p>",
    moons: {
      ganymede: {period: 620, $img: $('img#ganymede')},
      callisto: {period: 270, $img: $('img#callisto')},
      io: {period: 2150, $img: $('img#io')}
    },
    $img: $('img#jupiter'),
    orbit: function () {
      const a = planets.jupiter.orbitRadius // orbit radius
      const b = planets.jupiter.period
      const c = planets.jupiter.moons.ganymede.period / 10 // the 10 is just to slow things down
      const d = planets.jupiter.moons.callisto.period / 10 // the 10 is just to slow things down
      const e = planets.jupiter.moons.io.period / 10 // the 10 is just to slow things down

      jupiterTime = jupiterTime + (rateFactor * 365/b)
      jupiterX = (a * (Math.sin(jupiterTime)) + screenCentreX - 50);
      jupiterY = (a * (Math.cos(jupiterTime)) + screenCentreY - 50);
      planets.jupiter.$img.offset({left: jupiterX, top: jupiterY})
      updateYearsInfo (planets.jupiter.name, jupiterTime);

      ganymedeX = (50 * (Math.sin(jupiterTime * c)) + jupiterX + 25);
      ganymedeY = (50 * (Math.cos(jupiterTime * c)) + jupiterY + 25);
      planets.jupiter.moons.ganymede.$img.offset({left: ganymedeX, top:ganymedeY})

      callistoX = (50 * (Math.sin(jupiterTime * d)) + jupiterX + 25);
      callistoY = (50 * (Math.cos(jupiterTime * d)) + jupiterY + 25);
      planets.jupiter.moons.callisto.$img.offset({left: callistoX, top:callistoY})

      ioX = (50 * (Math.sin(jupiterTime * e)) + jupiterX + 25);
      ioY = (50 * (Math.cos(jupiterTime * e)) + jupiterY + 25);
      planets.jupiter.moons.io.$img.offset({left: ioX, top:ioY})
    },
    clicked: $('img#jupiter').on('click', function () { // this works
      displayInfo (planets.jupiter.info, planets.jupiter.name)
    })
  },
  saturn: {
    period: 10767,
    moons: {
      titan: {period: 700, $img: $('img#titan')},
      rhea: {period: 2400, $img: $('img#rhea')}
    },
    $img: $('img#saturn'),
    orbitRadius: 300,
    name: "saturn",
    info: "<p>Saturn is smaller than Jupiter, but way cooler. It has has a butt load of moons. (pun).</p><p>According to some page on the internet Saturn's rings are about 282,000 km across, but only about 1 km thick.</p>",
    orbit: function () {
      const a = planets.saturn.orbitRadius // orbit radius
      const b = planets.saturn.period
      const c = planets.saturn.moons.titan.period / 50 // the 20 is just to slow things down
      const d = planets.saturn.moons.rhea.period / 50 // the 20 is just to slow things down

      saturnTime = saturnTime + (rateFactor * 365/b)
      saturnX = (a * (Math.sin(saturnTime)) + screenCentreX - 50);
      saturnY = (a * (Math.cos(saturnTime)) + screenCentreY - 50);
      planets.saturn.$img.offset({left: saturnX, top: saturnY})
      updateYearsInfo (planets.saturn.name, saturnTime)

      titanX = (50 * (Math.sin(saturnTime * c)) + saturnX + 25);
      titanY = (50 * (Math.cos(saturnTime * c)) + saturnY + 25);
      planets.saturn.moons.titan.$img.offset({left: titanX, top:titanY})

      rheaX = (50 * (Math.sin(saturnTime * d)) + saturnX + 25);
      rheaY = (50 * (Math.cos(saturnTime * d)) + saturnY + 25);
      planets.saturn.moons.rhea.$img.offset({left: rheaX, top:rheaY})
    },
    clicked: $('img#saturn').on('click', function () { // this works
      displayInfo (planets.saturn.info, planets.saturn.name)
    })
  },
  uranus: {
    period: 30660,
    moons: {titania: {period: 1},oberon: {period: 11}},
    $img: $('img#uranus'),
    orbitRadius: 350,
    name: "uranus",
    info: "<p>by this stage I've had enough of looking up cute facts about planets</p>",
    img: $img = $('img#uranus'),
    orbit: function () {
      const a = planets.uranus.orbitRadius // orbit radius
      const b = planets.uranus.period
      //console.log(a);
      uranusTime = uranusTime + (rateFactor * 365/b)
      uranusX = (a * (Math.sin(uranusTime)) + screenCentreX - 50);
      uranusY = (a * (Math.cos(uranusTime)) + screenCentreY - 50);
      //console.log(mercuryX, mercuryY);
      planets.uranus.$img.offset({left: uranusX, top: uranusY})
      updateYearsInfo (planets.uranus.name, uranusTime)
    },
    clicked: $('img#uranus').on('click', function () { // this works
      displayInfo (planets.uranus.info, planets.uranus.name)
    })
  },
  neptune: {
    period: 60150,
    moons: {triton: {period: 1}},
    $img: $('img#neptune'),
    orbitRadius: 400,
    name: "neptune",
    info: "<p><a href=\"http://www.neptunepalace.com.au/\">A malaysian, chinese, hala restaurant at circular quay</a></p>",
    orbit: function () {
      const a = planets.neptune.orbitRadius // orbit radius
      const b = planets.neptune.period
      //console.log(a);
      neptuneTime = neptuneTime + (rateFactor * 365/b)
      neptuneX = (a * (Math.sin(neptuneTime)) + screenCentreX - 50);
      neptuneY = (a * (Math.cos(neptuneTime)) + screenCentreY - 50);
      //console.log(mercuryX, mercuryY);
      planets.neptune.$img.offset({left: neptuneX, top: neptuneY})
    },
    clicked: $('img#neptune').on('click', function () { // this works
      displayInfo (planets.neptune.info, planets.neptune.name)
    })
  },
  comet: {
      period: (1000 * Math.random()),
      $img: $('img#comet'),
      orbitRadius: 400,
      name: "ermergerd a comet, we all gon die",
      info: "<p>This is John's comet which appears occassionally and randomly. No one knows much about the actual orbits of comets, and this will remain a mystery while humankind awaits the advent of advanced computing machines</p><p>The images for the comet and the planets are neither the same shape or size, which makes testing for nearness kinda difficult</p>",
      orbit: function () {
        const a = planets.comet.orbitRadius // orbit radius
        const b = planets.comet.period
        //console.log(a);
        cometTime = cometTime + (rateFactor * 365/b)
        cometX = 2 * (a * (Math.sin(cometTime)) + screenCentreX - 200);
        cometY = (a * (Math.cos(cometTime)) + screenCentreY - 100);
        //console.log(mercuryX, mercuryY);
        planets.comet.$img.offset({left: cometX, top: cometY});
        updateYearsInfo (planets.neptune.name, neptuneTime)
        if (isNear ((cometX+100), (cometY+100), (earthX+50), (earthY-50))) {
          displayInfo (planets.comet.info, planets.comet.name)
          //debugger;
          $('#info').fadeOut(20000)
        }
      },
      clicked: $('img#comet').on('click', function () { // this works
        displayInfo (planets.comet.info, planets.comet.name)
      })
  }
}

// cat
const cat = {
  $catgif:  $('img#cat'),
  walk: function () {
    a = rateFactor * 400
    catX = cat.$catgif.offset().left
    catY = cat.$catgif.offset().top
    // tru for direction is left-to-right and top-to-bottom

    // fchange direction at window edges
    if (catX >= windowWidth-70) {blCatDirectionX = false}
    if (catX <= 0) {blCatDirectionX = true}
    if (catY >= windowHeight-95) {blCatDirectionY = false}
    if (catY <= 0) {blCatDirectionY = true}

    if (blCatDirectionX) {
      (catX = catX +  a)}
      else {(catX = catX -  a)}
    if (blCatDirectionY) {
      (catY = catY +  a)}
      else {(catY = catY -  a)}

    cat.$catgif.offset({left: (catX), top: (catY)})

    // if (isNear ((cometX+100), (cometY+100), (earthX+50), (earthY-50))) {
    //   displayInfo (planets.comet.info, planets.comet.name)
    //   //debugger;
    //   $('#info').fadeOut(20000)
    // }
    //

    arr1 = [mercuryX, mercuryY, venusX, venusY, earthX, earthY, marsX, marsY, jupiterX, jupiterY, saturnX, saturnY, uranusX, uranusY, neptuneX, neptuneY]
    for (var i = 0; i < arr1.length; i = i + 2) {
      otherX = arr1[i];
      otherY = arr1[i+1]
      if (isNear(catX, catY, otherX, otherY)) {
        blCatDirectionX = !blCatDirectionX;
        blCatDirectionY = blCatDirectionY
      }
    }



  }
}









/////////// Set initial positions
planets.sol.$img.offset({left:(screenCentreX-60), top:(screenCentreY-60)});
cat.$catgif.offset({left: (windowWidth-320), top: (windowHeight-160)})
// $('#input').offset({left: 50, top: 800});

const moonInfo = "<p>There are lots of moons. They are not all shown on this page.</p><p>Jupiter and Satiurn have so many moons, no one has ever been able to count them all. Uranus and Neptune have moons too, but I had run out of puff by then.</p> <p>Also the speed of the moons is a bit ficticous. Where there are two or more moons per planet, their speeds relative to each other is about right<p>"
const moonName = "moons"

clicked: $('img.moon').on('click', function () { // this works
  displayInfo (moonInfo, moonName)
})

const displayInfo = function (info, name) {
  strHeader = '<h1>' + name + '</h1>';
  strPara = info
  $('#info').html(strHeader + strPara).show();
}

const isNear = function (meX, meY, otherX, otherY) {
  //console.log(meX, meY, otherX, otherY);
  if ((Math.abs(meX - otherX) < nearnessConstant) && (Math.abs(meY-otherY) < nearnessConstant)) {
    //console.log(meX, meY, otherX, otherY);
    return true;
  }
}

const updateYearsInfo = function (name, number) {
  //console.log(name, number);
  stringID = '#' + name + "Years";
  stringDisplay = name + " : " + ((Math.round( 10 * (number/ pie / 2) - 0.5)) / 10)
  $('#info3').show()
  $(stringID).html(stringDisplay).show();
}


const mercuryTimeDone = window.setInterval(planets.mercury.orbit, speedConstant);
const venusTimeDone = window.setInterval(planets.venus.orbit, speedConstant);
const earthTimeDone = window.setInterval(planets.earth.orbit, speedConstant);
const marsTimeDone = window.setInterval(planets.mars.orbit, speedConstant);
const jupiterTimeDone = window.setInterval(planets.jupiter.orbit, speedConstant);
const saturnTimeDone = window.setInterval(planets.saturn.orbit, speedConstant);
const uranusTimeDone = window.setInterval(planets.uranus.orbit, speedConstant);
const neptuneTimeDone = window.setInterval(planets.neptune.orbit, speedConstant);
const cometTimeDone = window.setInterval(planets.comet.orbit, speedConstant);

// start the cat
$('#catbox').on('click', function () { // this works
  const catTimerDone = window.setInterval(cat.walk, (speedConstant * 2));
})
