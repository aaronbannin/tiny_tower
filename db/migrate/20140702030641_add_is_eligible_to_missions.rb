class AddIsEligibleToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :is_eligible, :boolean, default: false
  end
end
