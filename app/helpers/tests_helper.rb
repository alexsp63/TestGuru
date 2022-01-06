module TestsHelper

  def test_header(test)
    if test.persisted?
      "Edit #{test.title.titleize} Test"
    else
      "Create New Test"
    end
  end

  def test_level(test)
    case test.level
    when 0..1
      :easy
    when 2..4
      :middle
    when 5..Float::INFINITY
      :difficult
    end
  end
end
