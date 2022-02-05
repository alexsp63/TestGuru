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

  def self.check_for_the_badge(test_passage)
    @user = test_passage.user
    check_passed_all_tests_for_category
    check_test_passed_by_try(test_passage)
    check_passed_all_tests_for_level
  end

  def self.check_passed_all_tests_for_category
    tests_passed = @user.test_passages.where(successful: true).pluck(:test_id).uniq
    Badge.where(criteria: :passed_all_tests_for_category).each do |b|
      all_tests_by_category = Test.tests_by_category_title(b.criteria_value).pluck(:id).uniq
      @user.badges.push(b) if tests_passed == all_tests_by_category
    end
  end

  def self.check_test_passed_by_try(test_passage)
    tests_passed = @user.test_passages.where(test: test_passage.test, successful: true)
    Badge.where(criteria: :test_passed_by_try).each do |b|
      @user.badges.push(b) if b.criteria_value.to_i == tests_passed.count
    end
  end

  def self.check_passed_all_tests_for_level
    tests_passed = @user.test_passages.where(successful: true).pluck(:test_id).uniq
    Badge.where(criteria: :passed_all_tests_for_level).each do |b|
      all_tests_by_level = Test.tests_by_level(b.criteria_value.to_i).pluck(:id).uniq
      @user.badges.push(b) if tests_passed == all_tests_by_level
    end
  end
end
