ready = ->
  $(".flash_card").each((index)->
    $card = $(this)
    $card.find(".character_block")
      .css("background", $card.data("background"))
      .on("click",()->
        if($card.data("reference") != undefined)
          document.location.href = $card.data("reference");
      )

    if($card.data("next-card") != undefined)
      $card.find(".next_card_indicator").on("click", ()->
        document.location.href = $card.data("next-card");
      )
  )

  #https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
  $("form.new_flash_card, form.edit_original_card").find('input:file').each((i, elem)->
    $file = $(elem)
    $form = $($file.parents('form:first'))
    $submit = $form.find('input[type="submit"]')
    $progressContainer = $form.find('.progress')
    $progressBar = $progressContainer.find('.progress-bar')
    console.log($file.data('s3-data'))
    $file.fileupload(
      fileInput:       $file,
      url:             $file.data('s3-url'),
      type:            'POST',
      autoUpload:       true,
      formData:         $file.data('s3-data'),
      paramName:        'file', # S3 does not like nested name fields i.e. name="user[avatar_url]"
      dataType:         'XML',  # S3 returns XML if success_action_status is set to 201
      replaceFileInput: false
      progressall: (e, data)->
        progress = parseInt(data.loaded / data.total * 100, 10);
        $progressBar
          .css('width', progress + '%')
          .text(progress + '%')
      start: (e)->
        $submit.prop('disabled', true)

        $progressContainer
          .removeClass('hide')
        $progressBar
          .css('width', '0%')
          .text("Uploading...")
        $progressBar.removeClass('progress-bar-success')
        $progressBar.removeClass('progress-bar-danger')
      done: (e, data)->
        key = $(data.jqXHR.responseXML).find("Key").text();
        url = $file.data('s3-host')+"/"+key

        $progressBar
          .addClass('progress-bar-success')
          .text("Done. Make sure to save the card itself.")
        input = $("<input />", {type: 'hidden', name: $file.attr('name'), value: url})
        $form.append(input)

        $submit.prop('disabled', false)
      fail: (e, data)->
        $submit.prop('disabled', false)
        $progressBar
          .removeClass('progress-bar-danger')
          .text("Upload failed.")

    )
  )

$(document).ready(ready)
$(document).on('page:load', ready)