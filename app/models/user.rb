class User < ApplicationRecord
  
  def get_all_tests_by_level(l)
    Test.joins('JOIN scores ON scores.test_id = tests.id').where('user_id = :user_id AND level = :level', user_id: self.id, level: l)
  end
    
end
