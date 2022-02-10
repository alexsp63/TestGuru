class Badge < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

  validates :title, presence: true
  validates :image_url, presence: true
  validates :description, presence: true
  validates :criteria, presence: true, uniqueness: { scope: :criteria_value }

  def self.criteria
    {
      "Успешное прохождение всех тестов из категории": :passed_all_tests_for_category,
      "Успешное прохождение теста с попытки №": :test_passed_by_try,
      "Успешное прохождение всех тестов уровня": :passed_all_tests_for_level
    }
  end
end
