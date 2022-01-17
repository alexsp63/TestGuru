class Admin < User
  validates :first_name, presence: true
  validates :second_name, presence: true
end
