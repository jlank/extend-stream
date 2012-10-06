reduceStream = require "reductionist"

module.exports = (init) ->
  reduceStream((memo, n, next) ->
    Object.keys(n).forEach (key) -> memo[key] = n[key]
    next(false, memo)
  , init, { every: false })