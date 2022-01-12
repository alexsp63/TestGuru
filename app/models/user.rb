class User < ApplicationRecord

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :second_name, presence: true

  has_secure_password

  def all_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
