<app>
  <div class="three wide column menu-column">
    <div class="ui fluid vertical inverted menu" riot-tag="menu"></div>
  </div>

  <div class="thirteen wide column grid">
      <resource resource={ resource } each={ resource in api.allResources() }></resource>
  </div>

  <script>
    this.api = opts.api
    this.app = opts.app
  </script>
</app>
