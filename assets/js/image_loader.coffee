$offset = 0
$count = 10
$ ->
  htmlToElement = (html) ->
    template = document.createElement('template')
    html = html.trim()
    template.innerHTML = html
    return template.content.firstChild

  image_container = (image) ->
    htmlToElement "<div class='image-container preview'>
                    <a href=#{image.photo_807}>
                      <img class='preview' src=#{image.photo_604}>
                    </a>
                  </div>"
  append_image = (image) ->
    $('.js-images-container').append image_container(image)
    return
  fill_page = (images_data) ->
    append_image image for image in images_data
    return

  load_images = (query, count) ->
    $url = $('.js-photos-url').val() + "?count=#{count}&q=#{query}&offset=#{$offset}"
    $.ajax $url,
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
          console.log "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
          fill_page(data)
    return
  $(".js-button-more").on "click", ->
    $offset+=10
    $('.js-images-container').empty()
    $q = $(".js-query-field").val()
    load_images($q, $count)
    return

  $(".js-button-send").on "click", ->
      $offset = 0
      $('.js-images-container').empty()
      $q = $(".js-query-field").val()
      load_images($q, $count)
      return
  return
