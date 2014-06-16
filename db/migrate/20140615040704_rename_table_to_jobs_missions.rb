class RenameTableToJobsMissions < ActiveRecord::Migration
  def change
  	rename_table :missions_jobs, :jobs_missions
  end
end
