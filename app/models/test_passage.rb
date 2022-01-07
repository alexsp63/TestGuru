class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

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

  def progress
    "#{test.questions.order(:id).index(current_question) + 1}/#{total}"
  end

  def score
    self.correct_questions
  end

  def percent
    (score.to_f / total * 100).round(2)
  end

  def success?
    percent >= 85
  end

  def result_class
    success? ? 'success-message' : 'fail-message'
  end

  def result_message
    success? ? 'Test is passed' : 'Test is not passed'
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    if answer_ids
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    else
      false
    end
  end

  def correct_answers
    current_question.answers.correct_answers
  end
end
