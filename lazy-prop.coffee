module.exports = (obj, props) ->
  for key, getter of props then do (key, getter) ->
    Object.defineProperty obj, key,
      configurable: true
      enumerable: true
      get: ->
        value = getter.call this
        Object.defineProperty this, key,
          configurable: true
          enumerable: true
          writable: false
          value: value
        value
  obj
