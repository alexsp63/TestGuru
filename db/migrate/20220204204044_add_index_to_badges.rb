class AddIndexToBadges < ActiveRecord::Migration[6.1]
  def change
    add_index :badges, %i[criteria criteria_value], unique: true
  end
end
