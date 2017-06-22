class ChangeColumnsToFloat < ActiveRecord::Migration[5.0]
  def change_column
    change_column :pins, :longitude, :float
    change_column :pins, :latitude, :float
  end
end
