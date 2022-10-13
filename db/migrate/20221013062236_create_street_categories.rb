class CreateStreetCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :street_categories do |t|
      t.references :street, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
