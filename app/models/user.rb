class User < ApplicationRecord
  has_many :tests, dependent: :destroy
  has_many :tests_users
  has_many :tests, through: :tests_users, dependent: :destroy

  def all_tests_by_level(level)
    tests.where(level: level)
  end
end
