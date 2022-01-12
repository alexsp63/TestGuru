module TestPassagesHelper
  def result_class(test_passage)
    test_passage.success? ? 'success-message' : 'fail-message'
  end

  def result_message(test_passage)
    test_passage.success? ? 'Test is passed' : 'Test is not passed'
  end
end
