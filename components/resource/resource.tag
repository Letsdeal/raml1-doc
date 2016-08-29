<resource>

  <div class="ui row grid">
    <div class="seven wide column">
      <h1 class="ui dividing header">{ resource.displayName() }</h1>
    </div>

    <div class="nine wide column third-column"></div>
  </div>

  <div class="ui row grid">
    <div class="seven wide column">
      <resource-method method={ method } resource={ resource }
        each={ method in resource.methods() }></resource-method>
    </div>

    <div class="nine wide column third-column">
      <method-response resource={ resource }></method-response>
    </div>

  </div>

  <script>
    this.app = this.parent.app
    this.resource = opts.resource
    this.schemas = this.parent.schemas
  </script>

</resource>
