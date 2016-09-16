<method-request>
  <div class="ui segment">
    <query-parameters method={ opts.method } />
    <request-body each={ body in opts.method.body() } body={ body } />
  </div>
</method-request>
