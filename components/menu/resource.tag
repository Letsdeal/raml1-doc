<menu-resource>
  <a class="item" each={ method in opts.resource.methods() }
    href={ '#' + _.toUpper(method.method()) + '_' + resource.completeRelativeUri() }>
    { _.toUpper(method.method()) } { resource.completeRelativeUri() }
  </a>

  <menu-resource each={ resource in opts.resource.resources() }
    resource={ resource }></menu-resource>

  <script>
    this._ = require('lodash')
  </script>
</menu-resource>
