class ChangeColumnNamesInFloorsJobs < ActiveRecord::Migration
  def change
  	rename_column :floors_jobs, :floors_id, :floor_id
  	rename_column :floors_jobs, :jobs_id, :job_id
  	rename_column :missions_jobs, :missions_id, :mission_id
  	rename_column :missions_jobs, :jobs_id, :job_id
  end
end
