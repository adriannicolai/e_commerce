class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.string :phone_number
      t.string :province
      t.string :city
      t.string :detailed_address
      t.boolean :is_billing
      t.boolean :is_default

      t.timestamps
    end
  end
end
