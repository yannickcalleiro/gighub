
// ***Artist Search***
$(function(){
function searchResults () {
var selection = $('.js-search').val()
  var request = $.get('/search/'+selection);

  function artistResults (data) {
    $('.js-results').empty()
    data.forEach(function(artist) {
      $('.js-results').append('<li>' + "Name: " + artist.display_name + '</li>' )
    });
  }

  function handleError (err1, err2, err3) {
    console.error('OH NO!!', err1, err2, err3);
  }
 
  request.done(artistResults);
  request.fail(handleError);
}

$('.js-artists').on('click', searchResults);
})