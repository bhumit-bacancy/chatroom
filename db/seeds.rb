# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create(username: "darpan", password: "123456")
# User.create(username: "keval", password: "123456")
# User.create(username: "khunt", password: "123456")
# User.create(username: "darshan", password: "123456")

Message.create(body: "hello there", user: User.first)
Message.create(body: "hello i am new", user: User.second)
Message.create(body: "ok", user: User.first)