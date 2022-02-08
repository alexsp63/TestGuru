module Badges
  class AllTestsForLevelSpecification < AbstractRuleSpecification
    def satisfies?
      @test_passage.user.test_passages.where(successful: true).pluck(:test_id).uniq == Test.tests_by_level(@value.to_i).pluck(:id).uniq
    end
  end
end
