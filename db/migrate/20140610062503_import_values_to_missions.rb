class ImportValuesToMissions < ActiveRecord::Migration
  def change
   	execute <<-SQL
  		copy missions from '/Users/admin/Downloads/missions_table.csv' delimiter ',' csv header
  	SQL
  end
end
