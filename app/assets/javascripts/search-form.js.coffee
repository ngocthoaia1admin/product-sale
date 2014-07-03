$ ->
  $(".search-form-toggle").click (e)->
    e.preventDefault()
    target = $(this).attr("data-target")
    $("##{target}").slideToggle("fast")