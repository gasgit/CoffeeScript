# pass variable amount of arguments

bands = (first, second, others...) ->
  NumOne = first
  NumTwo = second
  various = others

  console.log "1: " + NumOne
  console.log "2: " + NumTwo
  console.log "Others: " + others


bands "Metallica", "Megadeth", "Slayer"

console.log "***************************"

bands "Metallica", "Megadeth", "Slayer", "Anthrax", "Gojira"


console.log "***************************"

listings = [

  "Metallica", "Megadeth", "Slayer", "Anthrax", "Gojira", "Muse"

]
# call function using splats
bands listings...
