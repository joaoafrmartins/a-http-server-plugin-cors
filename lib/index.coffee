cors = require 'cors'

merge = require 'lodash.merge'

module.exports = (next) ->

  @config.cors = merge require('./config'), @config?.cors or {}

  @app.use cors @config.cors

  next null
