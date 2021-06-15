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
tests = users[0].created_tests.create!([
                                         { title: "Ruby", level: 0, category: back },
                                         { title: "CSS", level: 3, category: front },
                                         { title: "HTML", level: 2, category: front },
                                         { title: "Rails", level: 1, category: back }
                                       ])
questions = []
tests.each do |test|
    questions << test.questions.create!(body: "Вопроса №1 теста #{test.title}")
end
questions[0].answers.create!(body: "Ответ №1", correct: false)
questions[0].answers.create!(body: "Ответ №2", correct: true)
questions[1].answers.create!(body: "Ответ №1", correct: true)
questions[1].answers.create!(body: "Ответ №2", correct: false)
questions[2].answers.create!(body: "Ответ №1", correct: false)
questions[2].answers.create!(body: "Ответ №2", correct: true)
questions[3].answers.create!(body: "Ответ №1", correct: false)
questions[3].answers.create!(body: "Ответ №2", correct: true)

users[1].results.create!([
                           { grade: 5, test_id: tests.first },
                           { grade: 4, test_id: tests.last }
                         ])