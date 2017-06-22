class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.string :pin_name
      t.string :address
      t.text :description
      t.integer :map_id
      t.integer :category_id
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
