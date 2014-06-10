class DeleteFromAndReloadFloorsJobs < ActiveRecord::Migration
  def change
    execute <<-SQL
  		delete from floors_jobs
  	SQL
	execute <<-SQL
		copy floors_jobs from '/Users/admin/Downloads/floors_jobs_table.csv' delimiter ',' csv header
	SQL
  end
end
