module Badges
  class AllTestsForCategorySpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.user.test_passages.where(successful: true).pluck(:test_id).uniq == Test.tests_by_category_title(@value).pluck(:id).uniq
    end
  end
end
