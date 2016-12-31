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
    sql = "insert into [Sections] values (?,?)"
    db.run sql,item.id, item.description, (err) ->
      callback err if err?

  for item in people
    sql = "insert into [People] values (?,?,?,?)"
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


selectAll = (callback) ->
  sql = "select * from People"
  db.all sql, (err, rows) ->
    unless err?
      for row in rows
        console.log " ID: #{row.id}: FIRST: #{row.first_name}: LAST: #{row.last_name}"
    else
      console.log err
      callback()

selectCount = (callback) ->
  sql = "select count (*) as 'count'from sections "
  db.get sql, (err, row) ->
    unless err?
      console.log "There are #{row.count} rows in sections table!"
    else
      console.log err
      callback()


orderFirst = (callback) ->

  sql = "select * from people order by first_name"
  db.all sql, (err, rows) ->
    unless err?
      console.log "There are #{rows.length} in people table"
      for row in rows
        console.log "#{row.id}: #{row.first_name}"
    else
      console.log err



orderDesc = (callback) ->
  sql = "select * from Sections order by description"
  db.each sql, (err, row) ->
    unless err?
        console.log "#{row.id}: #{row.description}"
    else
      console.log err


join = (callback) ->

  sql = "select description, first_name, last_name from sections cross join people"
  db.each sql, (err, row) ->
    unless err?
      console.log "#{row.description}: #{row.first_name}: #{row.last_name}"
    else
      console.log err
      callback()


selectAll (err) ->
  unless err?
  else
    console.log err
