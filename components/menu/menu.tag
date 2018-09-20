<menu>
  <div class="item">
    <div class="header">{ api.title() }</div>

    <div class="menu">
      <a class="item" href="#{ encodeURIComponent(documentation.title()) }"
          each={ documentation in api.documentation() }>
        { documentation.title() }
      </a>
    </div>
  </div>

  <!--
  <div class="item">
    <div class="header">Objects</div>

    <div class="menu">
        <a class="item" href={ '#' + schema.key() } each={ schema in api.schemas() }>
          { _.capitalize(schema.key()) }
        </a>
    </div>
  </div>
  -->

  <div class="item" each={ resource in api.resources() }>
    <div class="header">{ resource.displayName() }</div>

    <div class="menu">
      <menu-resource resource={ resource }></menu-resource>
    </div>
  </div>

  <script>
    this._ = require('lodash')
    this.api = opts.api
  </script>
</menu>
