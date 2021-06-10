class Test < ApplicationRecord
  def self.titles(category_title)
    categories.joins("LEFT JOIN tests ON tests.category_id = categories.category_id").where(title: category_title).order(title: :desc)
  end
end
