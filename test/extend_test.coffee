assert       = require "assert"
extendStream = require "../src/index"

describe "Extend stream"
  describe "when extending an object from an object w/ unique keys", ->
    it "should retain all the original key value pairs"
    it "should add all the new key value pairs"
  describe "when extending an object from 2 objects w/ unique keys", ->
    it "should retain all the original key value pairs"
    it "should add all the new key value pairs"
  describe "when extending an object from an object w/ conflicting keys", ->
    it "should retain non overriden keys"
    it "should accept the overriden keys"
    it "should retain all keys in the new object"
  describe "when extending an object from 2 objects w/ conflicting keys", ->
    it "should retain non overriden keys"
    it "should accept the overriden keys"
    it "should have the last object override previous objects"
    it "should retain all keys in the newest object"
  describe "when extending an object from something thats not an object", ->
    it "should retain all the original key value pairs"
    it "should not have any additional data"
