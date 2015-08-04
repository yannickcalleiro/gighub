
// ***Artist Search***
$(function(){
function searchResults () {
var role_select = $('.js-role').val()
var price_select = $('.js-price').val()
var hour_select = $('.js-hour').val()

  var request = $.get('/search/' + role_select + "/" + price_select + "/" + hour_select);

  function artistResults (data) {
    $('.js-results').empty()
    data.forEach(function(artist) {
      $('.js-results').append('<li>' + "Name: " + artist.display_name + '<button href="/events/<% @events.id %>">Add Artist</button>' + '</li>' )
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