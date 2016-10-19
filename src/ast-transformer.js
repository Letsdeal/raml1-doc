const visit = require('unist-util-visit')

var transformer = (ast, file) => {
	visit(ast, 'table', function (node) {
		node.data = {
      hProperties: {
        className: 'ui table'
      }
    }
	})
}

module.exports = () => {
	return transformer
}
