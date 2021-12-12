class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :first_name, null: false
      t.string :second_name, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end
