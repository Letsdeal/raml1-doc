<method-request>
  <h3 class="ui header">
    { _.toUpper(opts.method.method()) } { opts.resource.completeRelativeUri() }
  </h3>

  <p if={ opts.method.description() }>{ opts.method.description().value() }</p>

  <div>
    <query-parameters method={ opts.method } />
    <request-body each={ body in opts.method.body() } body={ body } />
  </div>

  <script>
    this._ = require('lodash')
  </script>
</method-request>
