class User < ApplicationRecord
  
  def all_tests_by_level(level)
    Test.joins('JOIN scores ON scores.test_id = tests.id')
          .where(scores: {user_id: self.id}, tests: {level: level})
  end
    
end
