// ***Artist Search***
$(document).ready(function(){
  $(function(){
  function searchResults () {
  var role_select = $('.js-role').val()
  var price_select = $('.js-price').val()
  var hour_select = $('.js-hour').val()
  var event_id = $('.event-id').val();

    var request = $.get('/search/' + role_select + "/" + price_select + "/" + hour_select);

    function artistResults (data) {
      $('.js-results').empty()
      console.log(data)
      data.forEach(function(artist) {
        if(artist.display_name != ""){
          $('.js-results').append(artist.display_name + '<button id="' + artist.id + '">Add Artist</button>' +  '<br />' )
          $('#' + artist.id).on('click', addArtistToEvents)
        }
      });

    }1

    function handleError (err1, err2, err3) {
      console.error('OH NO!!', err1, err2, err3);
    }
    
    request.done(artistResults);
    request.fail(handleError);
  }

  $('.js-artists').on('click', searchResults);
  })

  function addArtistToEvents(event){
    var event_id = $('.event-id').attr('id');
    console.log(event.target)
    var artist_id = $(event.target).attr('id')
    var request = $.post('/events/' + event_id + '/add_artists/' + artist_id);
    
    request.done(function(event){
      alert("Artist to event") 
      setTimeout(2000, window.location.replace("/"))
    })
    request.fail(function(event){
      alert("Failed. Please try again")
    })
  };
})
