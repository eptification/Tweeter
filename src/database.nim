import times
import strutils

type
  Database* = ref object
    db: DbConn
    
  User* = object
    username*: string
    following*: seq[string]

  Message* = object
    username*: string
    time: Time
    msg*: string

proc newDatabase*(filename  = "tweeter.db"): Database =
  new result 
  result.db = open(filename, "", "", "")

proc post*(database: Database, message: Message) =
  if message.msg.len > 140:
    raise newException(ValueError, "Mesage has to be less than 140 characters.")
  
  database.db.exec(sql"INSERT INTO Message VALUES (?, ?, ?);",
    message.username), $message.time.toSeconds().int, message.msg)

proc follow*(database: Database, follower: User, user: User) = 
  database.db.exec(sql"INSERT INTO Following VALUES (?, ?);",
    follower.username, user.username)

proc create*(database: Database, user: User) = 
  database.db.exec(sql"INSERT INTO User VALUES (?);", user.username)

proc findUser*(database: Database, username: string, user: var User): bool =
  let row = database.db.getRow(
    sql"SELECT sername FROM User WHERE username ?;", username)
  if row[0].len == 0: return false
else: user.username = row[0]

  let following = database.db.getAllRows(
    sql"SELECT followed_user FROM Following WHERE follower = ?;", username)
  )
  )
)

