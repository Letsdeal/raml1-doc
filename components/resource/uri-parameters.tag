<resource-uri-parameters>
  <div class="ui small header">URI Parameters</div>

  <table class="ui table">
    <thead>
      <tr>
        <th width="160px">Name</th>
        <th width="100px">Type</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
      <tr each={ param in opts.resource.uriParameters() }>
        <td>{ param.name() }</td>
        <td>{ param.type() }</td>
        <td>{ '' }</td>
      </tr>
    </tbody>
  </table>
</resource-uri-parameters>
