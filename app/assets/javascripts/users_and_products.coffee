$ ->
  $.each [0..3], (index) ->
    $("#js-product_images_attributes_"+String(index)+"_image").on 'change', (event) ->
      file = event.target.files[0]
      reader = new FileReader
      reader.readAsDataURL file
      reader.onload = (e) ->
        img = $('<img>')
        img.attr 'src', e.target.result
        $("#js-new_product_image"+String(index)+"").empty().append img

