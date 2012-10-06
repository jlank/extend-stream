extendStream = require "../src/index"
JSONStream   = require "JSONStream"
eventStream  = require "event-stream"

obj =
  run: "don't"
  walk: "to"
  the: "party"

lineStream = eventStream.map (file, next) -> next(false, file + "\n")

stream = extendStream(obj)

stream.pipe(JSONStream.stringify(false)).pipe(lineStream).pipe(process.stdout)
stream.write({ run: "fast don't" })
stream.write({ the: "awesome party" })
stream.end()
