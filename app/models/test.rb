class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions, dependent: :destroy
  has_many :tests_users
  has_many :users, through: :tests_users, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_levels, ->(start_level, end_level) { where(level: start_level..end_level) }
  scope :easy, -> { by_levels(0, 1) }
  scope :middle, -> { by_levels(2, 4) }
  scope :difficult, -> { by_levels(5, Float::INFINITY) }

  scope :desc_by_category, lambda { |category_title|
                             joins(:category)
                               .where(categories: { title: category_title })
                               .order(title: :desc)
                           }

  def self.desc_names_by_category(category_title)
    desc_by_category(category_title).pluck(:title)
  end
end
