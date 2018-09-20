<resource>
  <div class="ui row grid" if={ resource.parent().kind() == 'Api' }>
    <div class="seven wide column">
      <h2 class="ui dividing header">
        { resource.displayName() }
      </h2>
    </div>

    <div class="nine wide column third-column"></div>
  </div>

  <resource-method
    method={ method } resource={ resource }
    each={ method in resource.methods() }
  />

  <script>
    this.app = this.parent.app
    this.resource = opts.resource
  </script>
</resource>
