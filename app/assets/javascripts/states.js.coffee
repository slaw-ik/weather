# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.city').click (e) ->
    e.preventDefault()
    $('#weatherbox').addClass('progress')
    url = $(this).attr('href')
    $.ajax
      url: url
      success: (data)->
        $('#weatherbox').removeClass('progress')
        $('#weatherbox').html(data)
