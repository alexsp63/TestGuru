class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def total
    test.questions.count
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def score
    self.correct_questions
  end

  def percent
    (score.to_f / total * 100).round(2)
  end

  def success?
    percent >= SUCCESS_RATIO
  end

  def result_class
    success? ? 'success-message' : 'fail-message'
  end

  def result_message
    success? ? 'Test is passed' : 'Test is not passed'
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
  end

  def next_question
    current_question ? test.questions.order(:id).where('id > ?', current_question.id).first : test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end
end
