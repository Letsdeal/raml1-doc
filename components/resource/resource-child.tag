<resource-child>
  <div class="ui row grid">
    <div class="seven wide column">
      <resource-method method={ method } resource={ opts.resource }
        each={ method in opts.resource.methods() }></resource-method>
    </div>

    <div class="nine wide column third-column">
      <method-response resource={ opts.resource }></method-response>
    </div>
  </div>

  <script>
    this.app = this.parent.app
  </script>
</resource-child>
