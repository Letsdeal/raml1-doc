<method-responses>
  <div class="ui secondary pointing menu js-tab">
    <a class="ui dropdown item">
      <span>{ responses[0].code().value() }</span>
      <i class="dropdown icon"></i>
      <div class="menu">
        <div class="item" each={ response in responses } data-response-code={ response.code().value() } }>
          { response.code().value() }
        </div>
      </div>
    </a>

    <a class="item active" data-tab="schema-{ methodId }">
      <i class="code disabled icon"></i> Schema
    </a>

    <a class="item" data-tab="example-{ methodId }">
      <i class="info disabled icon"></i> Example
    </a>

    <a class="item" data-tab="try-{ methodId }">
      <i class="eyedropper disabled icon"></i> Try
    </a>
  </div>

  <div class="ui bottom attached tab active" data-tab="schema-{ methodId }">
    <div class={ ui: true, tab: true, 'js-json': true, active: isFirstResponse(response) }
        each={ response in responses }
        data-response-code={ response.code().value() } }>
      { parseSchema(response.body()[0].schemaContent()) }
    </div>
  </div>

  <div class="ui bottom attached tab" data-tab="example-{ methodId }">
    <div class={ ui: true, tab: true, 'js-json': true, active: isFirstResponse(response) }
        each={ response in responses }
        data-response-code={ response.code().value() } }>
      { response.body()[0].example().value() }
    </div>
  </div>

  <div class="ui bottom attached tab" data-tab="try-{ methodId }">
  </div>

  <script>
    this.$RefParser = require('json-schema-ref-parser')
    this.method = opts.method
    this.responses = this.method.responses()
    this.methodId = this.method.methodId().replace(/[\W]/g, '_')

    this.dereference = (schema) => {
      var data, done = false
      var resolver = this.parent.app.make('schema-resolver')

      this.$RefParser.dereference(schema, {
        resolve: { file: false, raml: resolver },
        dereference: { circular: 'ignore' }
      }, function(err, schema) {
        if (err) {
          console.error(err)
          return done = true
        }

        data = schema
        done = true
      })

      require('deasync').loopWhile(function(){ return !done })

      return data
    }

    this.parseSchema = (schema) => {
      this.jsonSchema = schema

      try {
        this.jsonSchema = JSON.parse(schema)
      } catch(e) {}

      let derefenced = this.dereference(this.jsonSchema)

      return JSON.stringify(derefenced)
    }

    this.isFirstResponse = (response) => {
      return this.responses[0].code().value() == response.code().value()
    }
  </script>
</method-responses>
