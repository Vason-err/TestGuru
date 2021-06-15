class Question < ApplicationRecord
  MAX_ANSWERS_AMOUNT = 4
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
end
