class DeleteFromAndReloadMissionsJobs < ActiveRecord::Migration
  def change
  	execute <<-SQL
  		delete from missions_jobs
  	SQL
	execute <<-SQL
		copy missions_jobs from '/Users/admin/Downloads/missions_jobs_table.csv' delimiter ',' csv header
	SQL
  	end
end
