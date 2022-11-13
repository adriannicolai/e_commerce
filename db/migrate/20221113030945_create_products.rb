class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :variation_json
      t.decimal :price, precision: 10, scale: 2
      t.decimal :cached_total_rating, precision: 1, scale: 1

      t.timestamps
    end
  end
end
