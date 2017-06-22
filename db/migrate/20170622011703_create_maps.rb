class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.string :map_name
      t.text :description
      t.boolean :public
      t.integer :user_id

      t.timestamps
    end
  end
end
