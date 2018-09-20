<resource-method>
  <a name={ _.toUpper(method.method()) + '_' + resource.completeRelativeUri() }></a>

  <div class="ui row grid">
    <div class="seven wide column">
      <method-request method={ method } resource={ resource } />
    </div>

    <div class="nine wide column third-column">
      <method-responses if={ method.responses().length } method={ method } />
    </div>
  </div>

  <script>
    this._ = require('lodash')
    this.method = opts.method
    this.resource = opts.resource
    this.app = this.parent.app
  </script>
</resource-method>
