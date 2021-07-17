class TestPassage < ApplicationRecord
  SUCCESS_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  scope :successful, -> { where(percent: SUCCESS_PERCENT..100) }

  before_validation :before_validation_set_next_question, on: :create

  validates :percent, inclusion: 0..100, allow_nil: true

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def accept!(answer_ids)
    if time_left?
      self.correct_questions += 1 if correct_answer?(answer_ids)
    else
      self.current_question = nil
    end

    self.percent = result
    save!
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def success_result?
    percent && percent >= SUCCESS_PERCENT
  end

  def completed?
    current_question.nil?
  end

  def next_question
    if test.present?
      sorted_questions = test.questions.order(:id)
      sorted_questions = sorted_questions.where('id > ?', current_question.id) if persisted?
      sorted_questions.first
    end
  end

  def time_left?
    time_left.positive?
  end

  def time_left
    timer = test.timer
    timer ? (self.created_at + timer.minutes - Time.current).ceil : Float::INFINITY
  end

  private

  def before_validation_set_next_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
