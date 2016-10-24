<query-parameters>
  <div class="ui segment" if={ queryParameters.length > 0 }>
    <a class="ui top left attached label">Query Parameters</a>

    <table class="ui very basic compact table">
      <tbody>
        <tr each={ param in queryParameters }>
          <td width="160px">{ param.name() }</td>
          <td width="100px">{ param.type() }</td>
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

      if (queryParameter.kind() == 'StringTypeDeclaration' && queryParameter.maxLength()) {
        details.push('max length: ' + queryParameter.maxLength())
      }

      if (queryParameter.kind() == 'NumberTypeDeclaration' && queryParameter.maximum()) {
        details.push('max: ' + queryParameter.maximum())
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
