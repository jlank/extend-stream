assert       = require "assert"
extendStream = require "../src/index"

describe "Extend stream", ->
  describe "when extending an object from an object w/ unique keys", ->
    before ->
      @target = { a: "a", b: "b" }
      src     = { c: "c", d: "d" }
      stream  = extendStream(@target)
      stream.write(src)
      stream.end()

    it "should retain all the original key value pairs", ->
      assert.equal "a", @target.a
      assert.equal "b", @target.b

    it "should add all the new key value pairs", ->
      assert.equal "c", @target.c
      assert.equal "d", @target.d

  describe "when extending an object from 2 objects w/ unique keys", ->
    before ->
      @target = { a: "a", b: "b" }
      src1    = { c: "c", d: "d" }
      src2    = { e: "e", f: "f" }
      stream  = extendStream(@target)
      stream.write(src1)
      stream.write(src2)
      stream.end()

    it "should retain all the original key value pairs", ->
      assert.equal "a", @target.a
      assert.equal "b", @target.b

    it "should add all the new key value pairs", ->
      assert.equal "c", @target.c
      assert.equal "d", @target.d
      assert.equal "d", @target.d
      assert.equal "f", @target.f

  describe "when extending an object from an object w/ conflicting keys", ->
    before ->
      @target = { a: "a", b: "b" }
      src     = { b: "n", c: "c" }
      stream  = extendStream(@target)
      stream.write(src)
      stream.end()

    it "should retain non overriden keys", ->
      assert.equal "a", @target.a

    it "should accept the overriden keys", ->
      assert.equal "n", @target.b

    it "should retain all keys in the new object", ->
      assert.equal "c", @target.c

  describe "when extending an object from 2 objects w/ conflicting keys", ->
    before ->
      @target = { a: "a", b: "b" }
      src1    = { b: "n", c: "c", d: "d" }
      src2    = { d: "n", e: "e" }
      stream  = extendStream(@target)
      stream.write(src1)
      stream.write(src2)
      stream.end()

    it "should retain non overriden keys", ->
      assert.equal "a", @target.a

    it "should accept the overriden keys", ->
      assert.equal "n", @target.b
      assert.equal "n", @target.d

    it "should retain all keys in the newest object", ->
      assert.equal "c", @target.c
      assert.equal "e", @target.e

  describe "when extending an object from something thats not an object", ->
    before ->
      @target = { a: "a", b: "b" }
      src     = "not an object"
      stream  = extendStream(@target)
      stream.write(src)
      stream.end()

    it "should retain all the original key value pairs", ->
      assert.equal "a", @target.a
      assert.equal "b", @target.b

    it "should not have any additional data", ->
      assert.equal 2, Object.keys(@target).length
