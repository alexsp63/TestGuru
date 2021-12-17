class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  def self.desc_names_by_category(category_title)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_title })
        .order(title: :desc)
        .pluck(:title)
  end
end
