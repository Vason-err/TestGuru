class Test < ApplicationRecord
  MIN_LEVEL = 0
  LEVELS = {
    easy: MIN_LEVEL..1,
    medium: 2..4,
    hard: 5..Float::INFINITY
  }.freeze

  belongs_to :category
  belongs_to :author, class_name: "User"

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :restrict_with_exception
  has_many :users, through: :results

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(LEVELS[:easy]) }
  scope :medium, -> { level(LEVELS[:medium]) }
  scope :hard, -> { level(LEVELS[:hard]) }
  scope :by_category, -> (category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
