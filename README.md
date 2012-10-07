Extend Stream
=============

[![Build Status](https://secure.travis-ci.org/JosephMoniz/extend-stream.png)](http://travis-ci.org/JosephMoniz/extend-stream)

Extend stream is a stream that takes an initial JSON object and extends it
with other JSON objects it receives and emits the final result when it's
read source is done streaming objects to it

```javascript
var extendStream = require("extend-stream");
var JSONStream   = require("JSONStream");
var eventStream  = require("event-stream");

obj = {
  run: "don't",
  walk: "to",
  the: "party"
}

var lineStream = eventStream(function(line, next) {
  next(false, line + "\n");
});

stream = extendStream(obj);

stream.pipe(JSONStream.stringify(false)).pipe(lineStream).pipe(process.stdout)

stream.write({ run: "fast don't" })
stream.write({ the: "awesome party" })
stream.end()
```

extendStream(init)
------------------
Extend stream exports a single function `extendStream`. This function takes only
one argument, which is the initial object value to extend.

 * @param {object} init - The initial object to extend
 * @returns {stream}