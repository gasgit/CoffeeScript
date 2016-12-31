sqlite = require 'sqlite3'

db = new sqlite.Database 'mydb.db'

createTables = (callback) ->
  sql = "CREATE TABLE IF NOT EXISTS[Sections](
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    description VARCHAR (100)
    );
    CREATE TABLE[People](
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      first_name VARCHAR (50),
      last_name VARCHAR (50),
      sections_id INTEGER REFERENCES Section (id)
    );"

  db.exec sql, (err) ->
    console.log "Error creating tables: #{err}" if err?
    callback err


populateTables = (callback) ->
  sections = [
    {id: 1,description: "support"}
    {id: 2, description: "sales"}
    {id: 3, description: "manufacturing"}
  ]

  people = [
    {id:1,first_name: "glen", last_name:"gordon"}
    {id:2, first_name: "david", last_name: "bowie"}
    {id:3, first_name: "leonard", last_name: "cohen"}
  ]

  for item in sections
    sql = "INSERT INTO [Sections] VALUES (?,?)"
    db.run sql,item.id, item.description, (err) ->
      callback err if err?

  for item in people
    sql = "INSERT INTO [People] VALUES (?,?,?,?)"
    db.run sql, item.id, item.first_name, item.last_name, (err) ->
      callback err if err?

  callback()


# createTables (err) ->
#   unless err?
#     populateTables (err) ->
#       unless err?
#         console.log "db ready!!"
#       else
#         console.log err


sql = "SELECT * FROM People"
db.all sql, (err, rows) ->
  unless err?
    for row in rows
      console.log " ID: #{row.id}: FIRST: #{row.first_name}: LAST: #{row.last_name}"
  else
    console.log err
