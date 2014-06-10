class ImportValuesToJobs < ActiveRecord::Migration
  def change
    execute <<-SQL
  		copy jobs from '/Users/admin/Downloads/jobs_table.csv' delimiter ',' csv header
  	SQL
  end
end
