# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: "a@gmail.com")
user2 = User.create(email: "foo@gmail.com")

url1 = ShortenedUrl.create_short_url(user1, "test.com")
url2 = ShortenedUrl.create_short_url(user2, "test2test.com")
