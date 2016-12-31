# add required module
redis = require('redis')
# create redis client
client = redis.createClient()
# add event listener to log errors
client.on 'error', (err) ->
  console.log "Error: #{err}"

# add connection event listener
client.on 'connect', ->
  console.log "Redis connected Sucessfully!"
  client.quit()

# create array
people = [
  'david bowie','leonard cohen',
  'prince','george michael',
]
# push each element to list
for person in people
  client.lpush 'legend', person

# view list by range 0,3
client.lrange 'legend', 0, 3, (err,items)->
  console.dir items

# insert in position
client.linsert 'legend', 'AFTER',
  'leonard cohen','carrie fisher', redis.print
  
# view in range 0,4
client.lrange 'legend', 0, 4, (err,items)->
  console.dir items
