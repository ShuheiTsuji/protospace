# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('#upload').on 'change', (event) ->
    file = event.target.files[0]
    reader = new FileReader
    reader.readAsDataURL file

    reader.onload = (e) ->
      text = e.target.result
      img = $('<img>')
      img.attr 'src', text
      $('#user_image').append img
      return

    return
  return
