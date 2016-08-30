<resource>
  <div class="ui row grid">
    <div class="seven wide column">
      <h1 class="ui dividing header">{ resource.displayName() }</h1>
    </div>

    <div class="nine wide column third-column"></div>
  </div>

  <resource-method method={ method } resource={ resource }
    each={ method in resource.methods() }></resource-method>

  <virtual each={ resource in resource.resources() }>
    <resource-method method={ method } resource={ resource }
      each={ method in resource.methods() }></resource-method>
  </virtual>

  <script>
    this.app = this.parent.app
    this.resource = opts.resource
  </script>
</resource>
