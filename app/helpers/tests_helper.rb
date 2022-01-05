module TestsHelper
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
