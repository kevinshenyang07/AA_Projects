# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

# Users
user1 = User.create!(username: 'Norris')
user2 = User.create!(username: 'Kevin')

# Polls
poll1 = Poll.create!(title: "Favorite Breakfast Food?", user_id: user1.id )
poll2 = Poll.create!(title: "Favorite Lunch Food?", user_id: user2.id )

# Questions
q1 = Question.create!(text: "Pancakes or waffles?", poll_id: poll1.id)
q2 = Question.create!(text: "Sandwich or burrito?", poll_id: poll2.id)
# q3 = Question.create!()

# Answer choices
ans1_a = AnswerChoice.create!(body: "Pancakes", question_id: q1.id)
ans1_b = AnswerChoice.create!(body: "Waffle", question_id: q1.id)
ans2_a = AnswerChoice.create!(body: "Sandwich", question_id: q2.id)
ans2_b = AnswerChoice.create!(body: "Burrito", question_id: q2.id)

# Responses
res1 = Response.create!(user_id: user1.id, question_id: q1.id)
res2 = Response.create!(user_id: user2.id, question_id: q2.id)
