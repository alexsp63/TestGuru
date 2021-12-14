class Test < ApplicationRecord

  def self.get_desc_names_by_category(c)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = :category', category: c).order(title: :desc).pluck(:title)
  end

end
