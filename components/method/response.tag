<method-response>
  <div class="ui secondary pointing menu js-tab">
    <a class="item active" data-tab="schema">
      Schema
    </a>

    <a class="item" data-tab="example">
      Example
    </a>

    <a class="item" data-tab="try">
      Try
    </a>
  </div>

  <div class="ui bottom attached tab active js-json" data-tab="schema">
    { JSON.stringify(jsonSchema) }
  </div>

  <div class="ui bottom attached tab js-json" data-tab="example">
    { resource.methods()[0].responses()[0].body()[0].example().value() }
  </div>

  <div class="ui bottom attached tab" data-tab="try">
  </div>

  <script>
    this.$RefParser = require('json-schema-ref-parser')
    this.resource = opts.resource
    this.schemas = opts.schemas
    this.method = this.resource.methods()[0]

    this.dereference = (schema) => {
      var data, done = false

      this.$RefParser.dereference(schema, function(err, schema) {
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
      this.jsonSchema = this.method.responses()[0].body()[0].schemaContent()
      this.jsonSchema = JSON.parse(this.jsonSchema)
      this.jsonSchema = this.dereference(this.jsonSchema)
    } else {
      this.jsonSchema = {}
    }
  </script>
</method-response>
