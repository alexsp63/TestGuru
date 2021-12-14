class Test < ApplicationRecord

  def self.desc_names_by_category(category_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
          .where(categories: {title: category_title})
          .order(title: :desc)
          .pluck(:title)
  end

end
