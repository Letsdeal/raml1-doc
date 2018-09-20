<menu-resource>
  <a class="item"
    each={ method in resource.methods() }
    href={ '#' + _.toUpper(method.method()) + '_' + resource.completeRelativeUri() }
  >
    { _.toUpper(method.method()) } { resource.completeRelativeUri() }
  </a>

  <menu-resource
    resource={ resource }
    each={ resource in resource.resources() }
  />

  <script>
    this._ = require('lodash')
    this.resource = opts.resource
  </script>
</menu-resource>
