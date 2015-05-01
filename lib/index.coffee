cors = require 'cors'

merge = require 'lodash.merge'

module.exports = (next) ->

  @config.cors = merge require('./config'), @config?.cors or {}

  process.on "a-http-server:shutdown:dettach", () ->

    process.emit "a-http-server:shutdown:dettached", "cors"

  @app.use cors @config.cors

  process.emit "a-http-server:shutdown:attach", "cors"

  next null
