class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title,
            :image_url,
            :rule,
            presence: true
  enum rule: {
    category: 0,
    level: 1,
    attempt: 2
  }

  def self.assignable(test_passage)
    return [] unless test_passage.success_result?

    all.find_each { |badge| badge.assign?(test_passage) }
  end

  def assign?(test_passage)
    Badges::RuleServiceDevelop.build(self, test_passage).call
  end
end
