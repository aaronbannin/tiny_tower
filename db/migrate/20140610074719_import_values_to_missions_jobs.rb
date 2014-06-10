class ImportValuesToMissionsJobs < ActiveRecord::Migration
  def change
   	execute <<-SQL
  		copy missions_jobs from '/Users/admin/Downloads/missions_jobs_table.csv' delimiter ',' csv header
  	SQL
  end
end
