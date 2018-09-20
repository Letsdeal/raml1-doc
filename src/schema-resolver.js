var _ = require('lodash')
var changeCase = require('change-case')

module.exports = function (api) { return {
  order: 1,
  canRead: /.*/i,

  read: function(file, callback) {
    let fileName = file.url.split('/').pop().replace(/\.json/g, '')

    let schema = _.find(api.schemas(), (schema) => {
      let schemaName = changeCase.paramCase(schema.key())
      return schemaName == fileName
    })
 
    callback(null, schema.value().value())
  }
}}
