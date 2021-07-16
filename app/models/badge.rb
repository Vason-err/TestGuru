class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title,
            :image_url,
            :rule_name,
            :rule_value,
            presence: true
end
