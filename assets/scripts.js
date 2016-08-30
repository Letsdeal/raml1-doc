$(function() {
  $('.js-tab .item').tab()

  $('.js-json').each(function(node) {
    try {
      var json = $(this).text()
      $(this).JSONView(json).JSONView('collapse', 1)
    } catch(e) {
      console.error(e)
    }
  })
})
