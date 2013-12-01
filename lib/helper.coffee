# Must be assert NOT 'cassert' because of  AssertionError class
assert = require 'assert'

module.exports.checkConfig = (env, moduleName, checker) ->
  try 
    checker()
  catch err
    if err instanceof assert.AssertionError
      msg = err.message.split " | "
      env.error "You have an error in your config file: #{msg[msg.length-1]}"
      env.error "In: #{moduleName}" if moduleName?
      env.error "details: #{msg[0]}" if msg.length is 2
      process.exit 1
    else 
    throw err
