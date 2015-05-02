cors = require 'cors'

configFn = require 'a-http-server-config-fn'

module.exports = (next) ->

  configFn @config,

    alias: "cors"

    file: "#{__dirname}/config"

  process.on "a-http-server:shutdown:dettach", () ->

    process.emit "a-http-server:shutdown:dettached", "cors"

  @app.use cors @config.plugins.cors

  process.emit "a-http-server:shutdown:attach", "cors"

  next null
