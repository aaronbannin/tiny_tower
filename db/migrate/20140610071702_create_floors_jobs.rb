class CreateFloorsJobs < ActiveRecord::Migration
  def change
    create_table :floors_jobs, :id => false do |t|
    	t.references :floors
    	t.references :jobs
    end
  	add_index :floors_jobs, :floors_id
  	add_index :floors_jobs, :jobs_id
  end
end
