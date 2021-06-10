class User < ApplicationRecord
  def tests_by_level(level)
    tests.joins("LEFT JOIN results ON tests.test_id = results.test_id").where("results.user_id = ? and tests.level = ?", id, level)
  end
end
