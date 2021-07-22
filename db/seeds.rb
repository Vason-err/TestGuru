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
admin = Admin.new(
  email: 'admin@mail.com',
  password: 'vas0707+',
  first_name: 'Vason',
  last_name: 'Daterr'
)
admin.skip_confirmation!
admin.save!
user = User.new(
  email: 'user@mail.com',
  password: 'password',
  first_name: 'San',
  last_name: 'Holef'
)
user.skip_confirmation!
user.save!

tests = admin.created_tests.create!([
                                         { title: "Ruby", level: 0, category: back },
                                         { title: "CSS", level: 3, category: front },
                                         { title: "HTML", level: 2, category: front },
                                         { title: "Rails", level: 1, category: back }
                                       ])
questions = []
tests.each do |test|
    questions << test.questions.create!(body: "Вопроса №1 теста #{test.title}")
end
questions << tests[0].questions.create!(body: "Вопроса №2 теста #{tests[0].title}")
questions[0].answers.create!(body: "Ответ №1", correct: false)
questions[0].answers.create!(body: "Ответ №2", correct: true)
questions[1].answers.create!(body: "Ответ №1", correct: true)
questions[1].answers.create!(body: "Ответ №2", correct: false)
questions[2].answers.create!(body: "Ответ №1", correct: false)
questions[2].answers.create!(body: "Ответ №2", correct: true)
questions[3].answers.create!(body: "Ответ №1", correct: false)
questions[3].answers.create!(body: "Ответ №2", correct: true)
questions[4].answers.create!(body: "Ответ №1", correct: false)
questions[4].answers.create!(body: "Ответ №2", correct: true)

Badge.create!([
                { title: 'Newbie', image_url: '/images/thumb.svg', rule: 0, rule_value: 'Backend',
                  description: "Successful passing of all tests of backend category" },
                { title: 'Swot)', image_url: '/images/star.svg', rule: 1, rule_value: 1,
                  description: 'Successful passing of all tests of 1 level' },
                { title: 'LuckyOne', image_url: '/images/diamond.svg', rule: 2, rule_value: 1,
                  description: 'Successful passing the test with a first attempt' }
              ])