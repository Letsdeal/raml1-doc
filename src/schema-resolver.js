var _ = require('lodash')

module.exports = function (api) { return {
  order: 1,

  canRead: /\.json$/i,

  read: function(file, callback) {
    let fileName = file.url.split('/').pop()

    let schema = _.find(api.schemas(), (schema) => {
      return schema.key() + '.json' == fileName
    })

    callback(null, schema.value().value())
  }
}}
