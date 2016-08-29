#!/usr/bin/env node

var fs = require('fs')
var glob = require('glob')
var program = require('commander')
var path = require('path')
var ramlParser = require('raml-1-parser')
var riot = require('riot')
var Inverse = require('inverse')

var app = new Inverse()

program
  .version('1.0.0')
  .usage('[options] [RAML input file]')
  .option('-o, --output [output]', 'HTML output file')
  .parse(process.argv)

if (!program.args[0]) {
  program.outputHelp()
  process.exit(1)
}

let ramlFile = path.resolve(process.cwd(), program.args[0])
let api = ramlParser.loadApiSync(ramlFile)

if (api.errors()) {
  /*api.errors().forEach(function(x){
    console.error({
      code: x.code,
      message: x.message,
      path: x.path,
      start: x.start,
      end: x.end
    })
  })*/

  // process.exit(1)
}

app.singleton('api', () => {
  return api
})

app.singleton('schema-resolver', () => {
  var resolver = require('../src/schema-resolver')
  return resolver(api)
})

let componentsPath = path.join(__dirname, '../components/**/*.tag')

glob.sync(componentsPath).forEach(function(tag) {
  require(tag)
})

let index = require('../index.tag')
let html = riot.render(index, { 'api': api, 'app': app })

process.stdout.write(html)
process.exit(0)
