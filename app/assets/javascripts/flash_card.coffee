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

$(document).ready(ready)
$(document).on('page:load', ready)