<resource-method>
  <h2 class="ui header">
    { _.toUpper(method.method()) } { resource.relativeUri().value() }
  </h2>

  <method-request method={ opts.method }></method-request>

  <script>
    this._ = require('lodash')
    this.method = this.parent.method
    this.resource = this.parent.resource
  </script>
</resource-method>
