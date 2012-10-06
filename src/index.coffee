reduceStream = require "reductionist"

module.exports = (init) ->
  reduceStream((memo, n, next) ->
    if typeof n is "object" then Object.keys(n).forEach (k) -> memo[k] = n[k]
    next(false, memo)
  , init, { every: false })