$(function() {
  $('.js-tab .item').tab()

  $('.js-json').each(function(node) {
    var json = $(this).text()
    $(this).JSONView(json)
  })
})
