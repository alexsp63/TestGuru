class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :title, presence: true
  validate :validate_answers_quantity

  private

  def validate_answers_quantity
    max_q = 4
    errors.add(:title) if !question.nil? && question.answers.size > max_q - 1
  end
end
