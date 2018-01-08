console.log("Connected");
// rewrite in jquery


const runCycle = function (e) {
  e.preventDefault(); // Don't leave this page.
  console.log("running");
  fetchInfo ()

}


$(document).ready(function () {
  console.log("doc ready");
  $('#searchForm').on('submit', runCycle)
});




last5Array = []

const fetchInfo = function () {
  const title = $('#searchTitle').val()
  console.log(title);

}

// const fetchInfo = function () {
//   title = document.getElementById('searchTitle').value
//
//   const xhr = new XMLHttpRequest ();
//   console.log(xhr.readyState);
//   let URL = "https://www.googleapis.com/books/v1/volumes?q=title:" + title;
//   xhr.open('GET', URL);
//   xhr.send()
//
//   xhr.onreadystatechange = function () {
//     console.log(xhr.readyState);
//     if ((xhr.readyState) !== 4) {
//       return;
//     }
//     //console.log(xhr.response)
//
//     const bigList = JSON.parse(xhr.response)
//     bookTitle = bigList["items"][0]["volumeInfo"]["title"]
//     author = bigList["items"][0]["volumeInfo"]["authors"][0]
//     publishedDate = bigList["items"][0]["volumeInfo"]["publishedDate"]
//     description = bigList["items"][0]["volumeInfo"]["description"]
//     rating = bigList["items"][0]["volumeInfo"]["averageRating"]
//     smallThumbnail = bigList["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"]
//     thumbnail = bigList["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
//
//     document.getElementById('bookTitle').innerHTML = bookTitle
//     document.getElementById('author').innerHTML = author
//     document.getElementById('description').innerHTML = description
//     document.getElementById('thumbnail').src = thumbnail
//
//   }
//
// };
//
// const demote = function () {
//   if (last5Array.length > 4) {
//     last5Array.pop()
//   }
//   lastBook = document.getElementById('bookTitle').innerHTML
//   lastAuthor = document.getElementById('author').innerHTML
//   lastDescription = document.getElementById('description').innerHTML
//   lastThumbnail = document.getElementById('thumbnail').src
//   lastBook = [lastBook, lastAuthor, lastDescription, lastThumbnail]
//
//   last5Array.unshift(lastBook)
//
//   console.log(last5Array);
//   makeHTML(last5Array)
//
// }
//
//
// const makeHTML = function (div2) {
//   itemHTML = ""
//   divHTML = ""
//   for (var i = 0; i < div2.length; i++) {
//     itemHTML = "<div class='second'><h1>" + div2[i][0] + "</h1><h2>" + div2[i][1] + "</h2><img src='" + div2[i][3] + "'</img></div>'"
//     divHTML = divHTML + itemHTML
//   }
//   document.getElementById('popsicle').innerHTML = divHTML
// }
//
//
// const runList = function () {
//   // just a list to be run when button is pressed...
//   demote ()
//   fetchInfo ()
// }
