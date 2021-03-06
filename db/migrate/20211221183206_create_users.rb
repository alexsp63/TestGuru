class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :first_name
      t.string :second_name

      t.timestamps
    end
  end
end
