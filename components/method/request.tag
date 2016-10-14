<method-request>
  <h3 class="ui header">
    { _.toUpper(method.method()) } { resource.completeRelativeUri() }
  </h3>

  <p>{ opts.method.description() }</p>

  <div>
    <query-parameters method={ opts.method } />
    <request-body each={ body in opts.method.body() } body={ body } />
  </div>
</method-request>
