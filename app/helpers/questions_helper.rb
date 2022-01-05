module QuestionsHelper

  def question_header(question, test)
    if question.persisted?
      "Edit #{test.title.titleize} Question" 
    else
      "Create New #{test.title.titleize} Question"
    end
  end 

  def questions_number(test)
    test.questions.count
  end

end
