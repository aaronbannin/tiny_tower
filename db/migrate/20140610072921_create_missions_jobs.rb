class CreateMissionsJobs < ActiveRecord::Migration
  def change
    create_table :missions_jobs, :id => false do |t|
    	t.references :missions
    	t.references :jobs
    end
    add_index :missions_jobs, :missions_id
    add_index :missions_jobs, :jobs_id
  end
end
