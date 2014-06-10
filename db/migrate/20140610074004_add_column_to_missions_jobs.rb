class AddColumnToMissionsJobs < ActiveRecord::Migration
  def change
  	add_column :missions_jobs, :job_quantity, :integer
  end
end
