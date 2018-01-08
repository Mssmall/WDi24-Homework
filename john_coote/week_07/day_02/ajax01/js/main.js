console.log("connected");

// const fetchBook = function (e) {
//   e.preventDefault(); // Don't leave this page.
//
//   const title = $('#query').val();
//   // $.ajax / $.get
//   $.getJSON(`https://www.googleapis.com/books/v1/volumes?q=title:${ title }`).done(function (info) {
//     const cover = info.items[0].volumeInfo.imageLinks.thumbnail;
//     const $image = $('#cover');
//     $image.attr('src', cover);
//   }).done(function (info) {
//     const title = info.items[0].volumeInfo.title;
//     const $image = $('#cover');
//     $image.attr('title', title);
//   }).fail(function () {
//     alert('Something bad happened');
//   });
// };

$( document ).ready(function() {
    console.log( "ready!" );
    updateCountryData()

    $('#B08').on('click', function() {
      console.log("clicked");
      displayCountryData()
    })


});




countries = {
  "1101": ["Australian", 0],
  "1102": ["Australian Aboriginal", 0],
  "6101": ["Chinese ", 0],
  "3204": ["Croatian", 0],
  "2303": ["Dutch", 0],
  "2101": ["English", 0],
  "5201": ["Filipino", 0],
  "2305": ["French", 0],
  "2306": ["German", 0],
  "3205": ["Greek", 0]
}

const displayCountryData = function () {
  $('#countryList').html("") // clear the list
  for( let key in countries) {
    console.log(key, countries[key]);
    $('#countryList').append(`<li> ${countries[key][0]} : ${countries[key][1]} </li>`)
  }
}


const fetchCountryData = function (strCountry) {
  community = 0
  $.getJSON("http://stat.data.abs.gov.au/sdmx-json/data/ABS_CENSUS2011_B08/1+2+3+4." + strCountry + ".0.AUS.0.A/all?detail=Full&dimensionAtObservation=AllDimensions&startPeriod=2011&endPeriod=2011").done(function (info) {
    community = info.dataSets[0].observations["0:0:0:0:0:0:0"][0] + info.dataSets[0].observations["1:0:0:0:0:0:0"][0] + info.dataSets[0].observations["2:0:0:0:0:0:0"][0] + info.dataSets[0].observations["3:0:0:0:0:0:0"][0]
    console.log(community);

    countries[strCountry][1] = community
  } )

};


const updateCountryData = function () {
  for( let key in countries) {
    console.log(key, countries[key]);
    fetchCountryData(key)
  }
};




const fetchSurveyData = function() {
  $.getJSON("http://stat.data.abs.gov.au/sdmx-json/data/AMLPS_RESP_2017/EP_TOT+EP_CLR+EP_NCLR+EP_NR+RESPCLR_TOT+RESPCLR_Y+RESPCLR_N.1+2.AUS+STE+FED.0+1+2+3+4+5+6+7+8+9+CANB+FENN+BANK+BART+BENN+BERO+BLAX+BRFD+CALA+CHIF+COOK+COWP+CUNN+DOBE+EMON+FARR+FOWL+GILM+GRAY+GREE+HUGH+HUME+HUNT+KSMI+LIND+LYNE+MACA+MACK+MACQ+MCMA+MITC+NENG+NEWC+NSYD+PAGE+PARK+PARR+PATE+REID+RICH+RIVE+ROBE+SHOR+SYDN+WARR+WATS+WENT+WERR+WHIT+LING+SOLO+BLAI+BONN+BOWM+BRIS+CAPR+DAWS+DICK+FADD+FAIR+FISH+FLYN+FORD+GRIF+GROO+HERB+HINK+KENN+LEIC+LILL+LONG+MARA+MCPH+MONC+MORE+OXLE+PETR+RANK+RYAN+WBAY+WRIG+ADEL+BARK+BOOT+GREY+HIND+KING+MAKI+MAYO+PADE+STUR+WAKE+BASS+BRAD+DENI+FRAN+LYON+ASTO+BALL+BATM+BEND+BRUC+CALW+CASE+CHIS+CORA+CORI+DEAK+DUNK+FLIN+GELL+GIPP+GOLD+GORT+HIGG+HOLT+HOTH+INDI+ISAA+JAGA+KOOY+LALO+LTRO+MALL+MARI+MCEW+MCMI+MELB+MENZ+MPOR+MURR+SCUL+WANN+WILL+BRAN+BURT+CANN+COWA+CURT+DURA+FORR+FREM+HASL+MOOR+OCON+PEAR+PERT+STIR+SWAN+TANG/all?detail=Full&dimensionAtObservation=AllDimensions").done (function (surveyInfo) {
    debugger;
  })
}
