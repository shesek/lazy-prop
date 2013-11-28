{ equal: eq } = require 'assert'
lazy = require '../lazy-prop.coffee'

describe 'lazy-prop', ->
  it 'works', ->
    obj = {}
    count = 0
    lazy obj, foo: -> ++count
    eq count, 0
    eq obj.foo, 1
    eq obj.foo, 1
    eq obj.foo, 1
    eq count, 1
  it 'works with prototypes', ->
    klass = class
    count = 0
    lazy klass::, foo: -> ++count
    a = new klass
    b = new klass
    eq count, 0
    eq a.foo, 1
    eq a.foo, 1
    eq count, 1
    eq b.foo, 2
    eq b.foo, 2
    eq count, 2
