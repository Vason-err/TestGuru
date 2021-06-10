# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
back, front = Category.create!([
                                 { title: "Backend" },
                                 { title: "Frontend" }
                               ])
users = User.create!([
                       { name: "User0", email: "user0@user.com", password: "password" },
                       { name: "User1", email: "user1@user.com", password: "drowssap"}
                     ])
tests = Test.create!([
                       { title: "Ruby", level: 0, category: back, author_id: users.first.id },
                       { title: "CSS", level: 3, category: front, author_id: users.first.id },
                       { title: "HTML", level: 2, category: front, author_id: users.first.id },
                       { title: "Rails", level: 1, category: back, author_id: users.first.id }
                     ])
questions = Question.create!([
                               { body: "Вопрос №1 теста Ruby", test_id: tests[0].id },
                               { body: "Вопрос №1 теста CSS", test_id: tests[1].id },
                               { body: "Вопрос №1 теста HTML", test_id: tests[2].id },
                               { body: "Вопрос №1 теста Rails", test_id: tests[3].id }
                             ])
Answer.create!([
                 { body: "Ответ №1", correct: false, question_id: questions[0].id },
                 { body: "Ответ №2", correct: true, question_id: questions[0].id },
                 { body: "Ответ №1", correct: false, question_id: questions[1].id },
                 { body: "Ответ №2", correct: true, question_id: questions[1].id },
                 { body: "Ответ №1", correct: true, question_id: questions[2].id },
                 { body: "Ответ №2", correct: false, question_id: questions[2].id },
                 { body: "Ответ №1", correct: false, question_id: questions[3].id },
                 { body: "Ответ №2", correct: true, question_id: questions[3].id }
               ])

Result.create!([
                 { grade: 5, test_id: tests.first.id, user_id: users.last.id },
                 { grade: 4, test_id: tests.last.id, user_id: users.last.id }
               ])