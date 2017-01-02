# until loop

console.log "Begin until loop!"

count = 0

until count > 10
  console.log "Count: " + count
  count++
console.log "End until Loop"
console.log " "
console.log "********************"
console.log " "
console.log "Begin loop"


# loop is a while variant
loop
  number = Math.random()*10 | 0
  console.log number
  if number == 3 then break
console.log "3 breaks"
