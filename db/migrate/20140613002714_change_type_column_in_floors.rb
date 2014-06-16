class ChangeTypeColumnInFloors < ActiveRecord::Migration
  def change
  	rename_column :floors, :type, :floor_type
  end
end
