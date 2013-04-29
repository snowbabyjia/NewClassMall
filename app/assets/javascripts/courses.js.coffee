# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ajaxSuccess((event, xhr, settings) ->
     $('.adjustable-rating .ajaxful-rating-wrapper').html(xhr.responseText))

$(()->$('.adjustable-rating a').click((event) -> 
  stars = parseFloat($(event.target).attr('class')[6..100])
  $('.me .ajaxful-rating li').css('width', (10 * stars) + "%")))

$(document).ajaxError((event, xhr, settings, thrownError) ->
     alert(xhr.responseText)
     alert((value for value in settings))
     alert(thrownError)
     $('.ajaxful-rating-wrapper').html(xhr.responseText))