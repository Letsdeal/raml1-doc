<documentation>
  <div class="ui row grid">
    <a name={ encodeURIComponent(documentation.title()) }></a>

    <div class="seven wide column">
      <h2 class="ui dividing header">
        { documentation.title() }
      </h2>

      <raw html={ parse(documentation.content().value()) }>
      </raw>
    </div>

    <div class="nine wide column third-column"></div>
  </div>

  <script>
    const remark = require('remark')
    const html = require('remark-html')
    const hljs  = require('remark-highlight.js')

    this.parse = function(text) {
      let result = remark().use([ html, hljs ]).process(text)
      return result.contents
    }
  </script>
</documentation>
