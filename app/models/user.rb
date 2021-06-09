class User < ApplicationRecord
  def tests_by_level(level)
    tests.where(level: level, test_id: results.select(test_id).distinct.where(user_id: id))
  end
end
