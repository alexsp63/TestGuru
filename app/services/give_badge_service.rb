class GiveBadgeService
  def initialize(current_user, test_passage)
    @user = current_user
    @test_passage = test_passage
  end

  def check_for_badges
    check_passed_all_tests_for_category
    check_test_passed_by_try
    check_passed_all_tests_for_level
  end

  def check_passed_all_tests_for_category
    tests_passed = @user.test_passages.where(successful: true).pluck(:test_id).uniq
    Badge.where(criteria: :passed_all_tests_for_category).each do |b|
      all_tests_by_category = Test.tests_by_category_title(b.criteria_value).pluck(:id).uniq
      @user.badges.push(b) if tests_passed == all_tests_by_category
    end
  end

  def check_test_passed_by_try
    tests_passed = @user.test_passages.where(test: @test_passage.test, successful: true)
    Badge.where(criteria: :test_passed_by_try).each do |b|
      @user.badges.push(b) if b.criteria_value.to_i == tests_passed.count
    end
  end

  def check_passed_all_tests_for_level
    tests_passed = @user.test_passages.where(successful: true).pluck(:test_id).uniq
    Badge.where(criteria: :passed_all_tests_for_level).each do |b|
      all_tests_by_level = Test.tests_by_level(b.criteria_value.to_i).pluck(:id).uniq
      @user.badges.push(b) if tests_passed == all_tests_by_level
    end
  end
end
