<app>
  <div class="three wide column menu-column">
    <div class="ui fluid vertical inverted menu" data-is="menu" api={ api }></div>
  </div>

  <div class="thirteen wide column grid">
    <documentation
      documentation={ documentation }
      each={ documentation in api.documentation() }
    />
    <resource
      resource={ resource }
      each={ resource in api.allResources() }
    />
  </div>

  <script>
    this.api = opts.api
    this.app = opts.app
  </script>
</app>
