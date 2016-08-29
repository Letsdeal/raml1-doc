<app>

  <div class="three wide column menu-column">
    <div class="ui fluid vertical inverted menu" riot-tag="menu"></div>
  </div>

  <div class="thirteen wide column grid">
      <resource resource={ resource } each={ resource in api.resources() }></resource>
  </div>

  <script>
    this.api = this.parent.api
    this.app = this.parent.app
    this.schemas = this.parent.schemas
  </script>
</app>
