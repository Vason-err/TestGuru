class User < ApplicationRecord
  has_many :results
  has_many :tests
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"
  def tests_by_level(level)
    Test.joins("LEFT JOIN results ON tests.id = results.test_id").where("results.user_id = ? and tests.level = ?", id, level)
  end
end
