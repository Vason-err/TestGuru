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
  has_many :test_passages, dependent: :restrict_with_exception
  has_many :users, through: :test_passages

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(LEVELS[:easy]) }
  scope :medium, -> { level(LEVELS[:medium]) }
  scope :hard, -> { level(LEVELS[:hard]) }
  scope :by_category, -> (category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: MIN_LEVEL }
  validates :timer, inclusion: 1..360, allow_nil: true

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end
end
