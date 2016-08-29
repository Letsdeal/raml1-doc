<method-request>
  <div if={ queryParameters.length > 0 }>
    <div class="ui small header">Query Parameters</div>

    <table class="ui table">
      <thead>
        <tr>
          <th width="160px">Name</th>
          <th width="100px">Type</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <tr each={ param in queryParameters }>
          <td>{ param.name() }</td>
          <td>{ param.type() }</td>
          <td>{ param.default() }</td>
        </tr>
      </tbody>
    </table>
  </div>

  <script>
    var _ = require('lodash')

    this.method = opts.method

    this.traits = _.map(this.method.parent().is(), (is) => {
      return is.trait()
    })

    this.queryParameters = this.method.queryParameters()

    this.traits.forEach((trait) => {
      trait.queryParameters().forEach((queryParameter) => {
        this.queryParameters.push(queryParameter)
      })
    })
  </script>
</method-request>
