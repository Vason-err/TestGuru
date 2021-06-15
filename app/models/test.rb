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

  def self.titles_by_category(category_title)
    joins(:category)
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
