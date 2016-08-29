<menu>

  <a class="item">
    { api.title() }
  </a>

  <div class="item">
    <div class="header">Objects</div>

    <div class="menu">
        <a class="item" href={ '#' + schema.key() } each={ schema in api.schemas() }>
          { _.capitalize(schema.key()) }
        </a>
    </div>
  </div>

  <div class="item" each={ resource in api.resources() }>
    <div class="header">{ resource.displayName() }</div>

    <div class="menu">
      <a class="item" each={ method in resource.methods() }>
        { _.toUpper(method.method()) } { resource.relativeUri().value() }
      </a>
    </div>
  </div>

  <script>
    this._ = require('lodash')
    this.api = this.parent.api
  </script>
</menu>
