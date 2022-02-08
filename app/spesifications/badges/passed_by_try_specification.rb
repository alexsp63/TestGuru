module Badges
  class PassedByTrySpecification < AbstractRuleSpecification
    def satisfies?
      @value.to_i == @test_passage.user.test_passages.where(test: @test_passage.test, successful: true).count
    end
  end
end
