<query-parameters>
  <div if={ queryParameters.length > 0 }>
    <a class="ui blue ribbon label">Query</a> Query Parameters

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
          <td>{getQueryParameterDescription(param) }</td>
        </tr>
      </tbody>
    </table>
  </div>

  <script>
    var _ = require('lodash')

    this.method = opts.method

    this.traits = _.map(this.method.is(), (is) => {
      return is.trait()
    })

    this.queryParameters = this.method.queryParameters()

    this.traits.forEach((trait) => {
      trait.queryParameters().forEach((queryParameter) => {
        this.queryParameters.push(queryParameter)
      })
    })

    this.getQueryParameterDescription = (queryParameter) => {
      var description = ''
      var details = []

      if (queryParameter.description()) {
        description = queryParameter.description().value() + ' '
      }

      if (queryParameter.kind() == 'StringTypeDeclaration' && queryParameter.enum().length) {
        details.push('enum [' + queryParameter.enum().join(', ') + ']')
      }

      if (queryParameter.default()) {
        details.push('default: ' + queryParameter.default())
      }

      if (queryParameter.example()) {
        details.push('example: ' + queryParameter.example())
      }

      if (details.length) {
        description = description + '(' + details.join(', ') + ')'
      }

      return description
    }
  </script>
</query-parameters>
