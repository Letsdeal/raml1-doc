var glob = require('glob')
var path = require('path')
var ramlParser = require('raml-1-parser')
var riot = require('riot')
var Inverse = require('inverse')

module.exports = (ramlFilePath) => {
  let app = new Inverse()
  let api = ramlParser.loadApiSync(ramlFilePath)

  if (api.errors()) {
    api.errors().forEach(function(x){
      console.error({
        code: x.code,
        message: x.message,
        path: x.path,
        start: x.start,
        end: x.end
      })
    })

    // process.exit(1)
  }

  app.singleton('api', () => {
    return api
  })

  app.singleton('schema-resolver', () => {
    var resolver = require('../src/schema-resolver')
    return resolver(api)
  })

  riot.tag('raw', '<span></span>', function(opts) {
      this.root.innerHTML = opts.html
  })

  let componentsPath = path.join(__dirname, '../components/**/*.tag')

  glob.sync(componentsPath).forEach(function(tag) {
    require(tag)
  })

  let index = require('../index.tag')

  return riot.render(index, { 'api': api, 'app': app })
}
