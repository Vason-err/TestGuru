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
                       {title: "Rails", level: 1, category: back, author_id: users.first.id }
                     ])
questions = []
answers = []
tests.each do |test|
  5.times do |index|
    questions << Question.create!(body: "Вопрос №#{index} теста #{test.title}", test_id: test.id)
    4.times { |index| answers << Answer.create!(body: "Ответ №#{index}", correct: index.zero?, question_id: index ) }
  end
end

results = Result.create!([
                           { grade: 5, test: tests.first, user_id: users.last },
                           { grade: 4, test: tests.last, user_id: users.last }
                         ])