toBase64 = (text) ->
  return (new Buffer text).toString('base64')

fromBase64 = (base64Text) ->
  return (new Buffer base64Text, 'base64').toString('ascii')

originalText = "hello base64"
encoded = toBase64(originalText)
console.log "#{encoded}"

decoded = fromBase64(encoded)
console.log "#{decoded}"
