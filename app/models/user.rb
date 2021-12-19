class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  def all_tests_by_level(level)
    tests.where(level: level)
  end
end
