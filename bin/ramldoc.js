#!/usr/bin/env node

var raml1doc = require('../src/raml1-doc')
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

let ramlFilePath = path.resolve(process.cwd(), program.args[0])
let html = raml1doc(ramlFilePath)

if (program.output) {
  fs.writeFileSync(program.output, html)
} else {
  process.stdout.write(html)
}

process.exit(0)
