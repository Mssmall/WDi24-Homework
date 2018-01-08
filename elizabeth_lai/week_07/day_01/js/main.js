

  const fetchBook = function (e) {
    e.preventDefault(); // Don't leave this page

    const title = $('#query').val();
    //Promises
    $.getJSON(`https://www.googleapis.com/books/v1/volumes?q=title:${title}`).done(function (info) {
      //can also use $.getJSON or $.get instead of $.ajax
        const cover = info.items[0].volumeInfo.imageLinks.thumbnail;
        const $image = $('#cover');
        $image.attr('src', cover);
      }).done(function (info) {
        const title = info.items[0].volumeInfo.title;
        const $image = $('#cover');
        $image.attr('title', title);
      }).fail(function () {
        alert('something bad happened');
      });
  };

  $(document).ready(function() {
    $('#title-search').on('submit', fetchBook);
});

///// ANOTHER VERSION
// $(document).ready(function() {
//
//   const $form = $('#title-search');
//   $form.on('submit', function (e) {
//     e.preventDefault(); // Don't leave this page
//
//     const title = $('#query').val();
//
//     // console.log(title);
//     $.ajax(`https://www.googleapis.com/books/v1/volumes?q=title:${title}`, {
//       success: function () {
//         console.log(info);
//         if (info.totalItems ===0) {
//           alert('Title not found');
//           return;
//         }
//
//         const cover = info.items[0].volumeInfo.imageLinks.thumbnail;
//         const title = info.items[0].volumeInfo.title;
//
//
//         const $image = $('#cover')
//         $image.attr('src', cover);
//         $image.attr('title', title);
//       }
//     });
//   });
// });
/////////////////////////////////////////////////////////

///////// NON JQUERY VERSION
// const getBook = function () {
//
//   const xhr = new XMLHttpRequest();
//   xhr.onreadystatechange = function () {
//
//     if (xhr.readyState !== 4) {
//       return;
//     }
//     const info = JSON.parse( xhr.response );
//
//   let cover = info.items[0].volumeInfo.imageLinks.thumbnail;
//   console.log(cover);
//
//   const img = document.createElement('img');
//   img.src = `${cover}`;
//   img.height = 250;
//   img.width = 200;
//   document.body.appendChild(img);
// }
// const bookTitle = document.getElementById('title').value;
// xhr.open('GET', `https://www.googleapis.com/books/v1/volumes?q=${bookTitle}`)
// xhr.send();
//
//
// };
//
// // getBook();
//
// const button = document.getElementsByTagName('button')[0];
// button.addEventListener('click', getBook);
