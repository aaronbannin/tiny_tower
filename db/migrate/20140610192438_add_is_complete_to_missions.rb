class AddIsCompleteToMissions < ActiveRecord::Migration
  def change
  	add_column :missions, :is_complete, :boolean, default: false
  end
end
