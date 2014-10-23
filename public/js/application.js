$(document).ready(function() {
	$('.deletePost').on('submit', function(event){
		event.preventDefault();
		var url = event.target.id
				par = $(event.target).parent();

		 $.get(url, function(serverResponse, status, jqXHR) {
      par.fadeOut();
    });
	});

  $('.editPost').on('submit', function(event){
    event.preventDefault();
    var url = event.target.id,
        par = $(event.target).parent()

    $.get(url, function(serverResponse, status, jqXHR) {
      par.html(serverResponse)
    });
  });
  
  $('.body').on('submit', '.submitEdit', function(event){
	  event.preventDefault();
	  var url = event.target.id,
	    par = $(event.target).parent(),
	    data = $(".submitEdit").serialize()

	  $.post(url, data, function(serverResponse, status, jqXHR) {
	    par.html(serverResponse)
	  });
	});
});