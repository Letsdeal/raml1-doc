<method-request>
  <div if={ method.queryParameters().length }>
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
        <tr each={ param in method.queryParameters() }>
          <td>{ param.name() }</td>
          <td>{ param.type() }</td>
          <td>{ param.default() }</td>
        </tr>
      </tbody>
    </table>
  </div>

  <script>
    this.method = this.parent.method
  </script>
</method-request>
