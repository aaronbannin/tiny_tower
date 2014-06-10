class ImportValuesToFloor < ActiveRecord::Migration
  def change
  	execute <<-SQL
  		copy floors from '/Users/admin/Downloads/floors_table.csv' delimiter ',' csv header
  	SQL
  end
end