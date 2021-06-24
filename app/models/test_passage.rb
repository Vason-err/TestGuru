class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
