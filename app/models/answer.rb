class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_question_answers_amount, on: :create

  def validate_question_answers_amount
    return if question.answers.count < Question::MAX_ANSWERS_AMOUNT

    errors.add(:question, 'Amount of answers for question should be from 1 to 4')
  end
end
