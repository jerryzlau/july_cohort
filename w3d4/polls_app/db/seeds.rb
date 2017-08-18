# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
user1 = User.create(username: "foppylau")
user2 = User.create(username: "addriv")
user3 = User.create(username: "trumpdestroyer5000")

Poll.delete_all
poll1 = Poll.create(title: "Math", author_id: user1.id)
poll2 = Poll.create(title: "Chinese", author_id: user2.id)
poll3 = Poll.create(title: "English", author_id: user3.id)
poll4 = Poll.create(title: "Science", author_id: user3.id)
poll5 = Poll.create(title: "RAVES!!", author_id: user1.id)

Question.delete_all
question1 = Question.create(body: "2+2 = 1", poll_id: poll1.id)
question2 = Question.create(body: "Ching Chong Ling Long?", poll_id: poll2.id)
question3 = Question.create(body: "To be or not to be?", poll_id: poll3.id)
question4 = Question.create(body: "Will Elon Musk succeed?", poll_id: poll4.id)
question5 = Question.create(body: "Is EDC plur?", poll_id: poll5.id)

AnswerChoice.delete_all
answer1 = AnswerChoice.create(choice: "A", question_id: question1.id)
answer2 = AnswerChoice.create(choice: "B", question_id: question1.id)
answer3 = AnswerChoice.create(choice: "C", question_id: question1.id)
answer4 = AnswerChoice.create(choice: "D", question_id: question1.id)
answer5 = AnswerChoice.create(choice: "A", question_id: question2.id)
answer6 = AnswerChoice.create(choice: "B", question_id: question2.id)
answer7 = AnswerChoice.create(choice: "C", question_id: question2.id)
answer8 = AnswerChoice.create(choice: "D", question_id: question2.id)
answer9 = AnswerChoice.create(choice: "A", question_id: question3.id)
answer10 = AnswerChoice.create(choice: "B", question_id: question3.id)
answer11 = AnswerChoice.create(choice: "C", question_id: question3.id)
answer12 = AnswerChoice.create(choice: "D", question_id: question3.id)
answer13 = AnswerChoice.create(choice: "A", question_id: question4.id)
answer14 = AnswerChoice.create(choice: "B", question_id: question4.id)
answer15 = AnswerChoice.create(choice: "C", question_id: question4.id)
answer16 = AnswerChoice.create(choice: "D", question_id: question4.id)
answer17 = AnswerChoice.create(choice: "A", question_id: question5.id)
answer18 = AnswerChoice.create(choice: "B", question_id: question5.id)
answer19 = AnswerChoice.create(choice: "C", question_id: question5.id)
answer20 = AnswerChoice.create(choice: "D", question_id: question5.id)

Response.delete_all
Response.create(author_id: user1.id, answer_choice_id: answer1.id)
Response.create(author_id: user2.id, answer_choice_id: answer2.id)

Response.create(author_id: user2.id, answer_choice_id: answer7.id)
Response.create(author_id: user3.id, answer_choice_id: answer10.id)
Response.create(author_id: user3.id, answer_choice_id: answer16.id)
Response.create(author_id: user1.id, answer_choice_id: answer19.id)
