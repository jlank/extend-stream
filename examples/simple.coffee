extendStream = require "../src/index"

obj =
  run: "don't"
  walk: "to"
  the: "party"

stream = extendStream(obj)

stream.on "data", (data) -> console.log data
stream.write({ run: "fast don't" })
stream.write({ the: "awesome party" })
stream.end()
