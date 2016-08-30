<resource-method>
  <div class="ui row grid">
    <div class="seven wide column">
      <h2 class="ui header">
        { _.toUpper(method.method()) } { resource.completeRelativeUri() }
      </h2>

      <method-request method={ opts.method }></method-request>
    </div>

    <div class="nine wide column third-column">
      <method-response resource={ resource }></method-response>
    </div>
  </div>

  <script>
    this._ = require('lodash')
    this.method = this.parent.method
    this.resource = this.parent.resource
    this.app = this.parent.app
  </script>
</resource-method>
