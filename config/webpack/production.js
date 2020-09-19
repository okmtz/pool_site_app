process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')
config.assets.js_compressor = :uglifier

module.exports = environment.toWebpackConfig()
