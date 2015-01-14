ready = ()->
  soundManager.stopAll()
  if($('.audio-play-pause').length > 0)
    soundManager.setup(
      url: swfAudioPlayerUrl,
      #flashVersion: 9, #optional: shiny features (default = 8)
      #optional: ignore Flash where possible, use 100% HTML5 mode
      preferFlash: false,
      onready: ()->
        #Ready to use; soundManager.createSound() etc. can now be called.
        $('.audio-play-pause').each (i, elem)->
          $this = $(elem)
          sound = soundManager.createSound {
            url: $this.data('src')
            autoLoad: true
          }
          $this
            .removeClass('hide')
            .on('click',(e)->
              e.stopPropagation()
              e.preventDefault()
              if(sound.playState == 0)
                sound.play()
              else if sound.stop
                sound.stop()
              $this.toggleClass('playing')
            )
    )

  $(".flash_cards_index .character_block").on('click', ()->
    $this = $(@)
    $this.find('.original').toggleClass('hide')
    $this.find('.translation').toggleClass('hide')
  )

  $(".flash_card").each((index)->
    $card = $(this)
    $card.find(".character_block")
      .css("background", $card.data("background"))
      # .on("click",()->
      #   if($card.data("reference") != undefined)
      #     document.location.href = $card.data("reference");
      # )

    # if($card.data("next-card") != undefined)
    #   $card.find(".next_card_indicator").on("click", ()->
    #     document.location.href = $card.data("next-card");
    #   )
  )

  $next = $(".next_card_indicator");
  if($next.length > 0)
    $("body").swipe(
      swipeLeft: (event, direction, distance, duration, fingerCount, fingerData)->
        Turbolinks.visit($next.attr('href'))
    )

  #https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
  $("form.new_flash_card, form.edit_flash_card").find('input:file').each((i, elem)->
    $file = $(elem)
    $form = $($file.parents('form:first'))
    $submit = $form.find('input[type="submit"]')
    $progressContainer = $form.find('.progress')
    $progressBar = $progressContainer.find('.progress-bar')
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
        url = "http://"+$file.data('s3-host')+"/"+key

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

stopSound = ->
  soundManager.stopAll()

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:before-change', stopSound)