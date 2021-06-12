class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("LEFT JOIN results ON tests.id = results.test_id").where("results.user_id = ? and tests.level = ?", id, level)
  end
end
