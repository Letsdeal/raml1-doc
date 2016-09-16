<method-response>
  <div class="ui secondary pointing menu js-tab">
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

  <div class="ui bottom attached tab active js-json" data-tab="schema-{ methodId }">
    { JSON.stringify(jsonSchema) }
  </div>

  <div class="ui bottom attached tab js-json" data-tab="example-{ methodId }">
    { response.body()[0].example().value() }
  </div>

  <div class="ui bottom attached tab" data-tab="try-{ methodId }">
  </div>

  <script>
    if (!opts.response) return

    this.$RefParser = require('json-schema-ref-parser')
    this.response = opts.response
    this.method = this.response.parent()

    this.dereference = (schema) => {
      var data, done = false
      var resolver = this.parent.app.make('schema-resolver')

      this.$RefParser.dereference(schema, { resolve: { raml: resolver }}, function(err, schema) {
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

    if (this.method) {
      this.jsonSchema = this.response.body()[0].schemaContent()

      try {
        this.jsonSchema = JSON.parse(this.jsonSchema)
      } catch(e) {}

      this.jsonSchema = this.dereference(this.jsonSchema)
      this.methodId = this.method.methodId().replace(/[\W]/g, '_')
    } else {
      this.jsonSchema = {}
      this.methodId = ''
    }
  </script>
</method-response>
