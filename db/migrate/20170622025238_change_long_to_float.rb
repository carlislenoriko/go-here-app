class ChangeLongToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :pins, :longitude, :float
    change_column :pins, :latitude, :float
  end
end
