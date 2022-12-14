class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.date :birthday
      t.string :email
      t.string :password
      t.integer :user_level

      t.timestamps
    end
  end
end
