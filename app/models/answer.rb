class Answer < ApplicationRecord
  MAX_QUANTITY = 4

  belongs_to :question

  validates :title, presence: true
  validate :validate_answers_quantity, on: :create

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_quantity
    errors.add(:title) if question.answers.count >= MAX_QUANTITY
  end
end
