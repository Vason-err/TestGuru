class Test < ApplicationRecord
  def self.titles(category_title)
    cat_id = categories.select(category_id).where(title: category_title)
    tests.where(category_id: cat_id).order(title: :desc)
  end
end
