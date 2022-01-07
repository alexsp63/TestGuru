module TestsHelper
  def test_header(test)
    if test.persisted?
      "Edit #{test.title.titleize} Test"
    else
      'Create New Test'
    end
  end

  def test_level(test)
    case test.level
    when 0..1 then :easy
    when 2..4 then :middle
    when 5.. then :difficult
    else :hero
  end
  end
end
