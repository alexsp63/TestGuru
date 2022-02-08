class GiveBadgesService
  RULES = {
    passed_all_tests_for_category: Badges::AllTestsForCategorySpecification,
    test_passed_by_try: Badges::PassedByTrySpecification,
    passed_all_tests_for_level: Badges::AllTestsForLevelSpecification
  }

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      add_badge(badge) if RULES[badge.criteria.to_sym].new(badge.criteria_value, @test_passage).satisfies?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges.push(badge)
  end
end
