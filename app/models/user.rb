class User < ApplicationRecord
  def tests_by_level(level)
    t_ids = []
    t_ids << results.select(test_id).distinct.where(user_id: id)
    tests.where(level: level, test_id: t_ids)
  end
end
