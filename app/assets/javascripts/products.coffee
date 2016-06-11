# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('#js-new_product').on 'change', (event) ->
    file = event.target.files[0]
    reader = new FileReader
    reader.readAsDataURL file

    reader.onload = (e) ->
      text = e.target.result
      img = $('<img>')
      img.attr 'src', text
      $('#js-new_product_image').empty().append img
      return

    return
  $('#js-product_images_attributes_1_image').on 'change', (event) ->
    file = event.target.files[0]
    reader = new FileReader
    reader.readAsDataURL file

    reader.onload = (e) ->
      text = e.target.result
      img = $('<img>')
      img.attr 'src', text
      $('#js-new_product_image1').empty().append img
      return

    return
  $('#js-product_images_attributes_2_image').on 'change', (event) ->
    file = event.target.files[0]
    reader = new FileReader
    reader.readAsDataURL file

    reader.onload = (e) ->
      text = e.target.result
      img = $('<img>')
      img.attr 'src', text
      $('#js-new_product_image2').empty().append img
      return

    return
  return
