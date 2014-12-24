ready = ->
  $(".flash_card").each((index)->
    $card = $(this)
    $card.
      css("background", $card.data("background"))
      .on("click",()->
        if($card.data("reference") != undefined)
          document.location.href = $card.data("reference");
      )
  )

$(document).ready(ready)
$(document).on('page:load', ready)