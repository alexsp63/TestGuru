class Badge < ApplicationRecord

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy

end
