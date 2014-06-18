module StaticPagesHelper
  
  # this pulls jobs for floors that is_owned. need to group together all jobs for a single mission
  #	@jobs_for_current_floors = Job.select("floors.name, floors.id,  jobs.name, jobs.id").joins(:floor).where("floors.is_owned and jobs.id = 3 and floors.is_owned")

  # for a job, find the needed floors
  # is_floor_owned = Floor.select(:is_owned).joins(:jobs).where("jobs.id = ?", job_id)
  
  # output all jobs for a mission
  # Job.select("jobs.id").joins(:mission).where("missions.id = ?", mission_id)
  
  # audit floor count
  # Floor.count(:all, :group => "floor_type")	
  	# update floors method, pass in floor_id and true_false
  	
  	# Floor.find_by(id: floor_id).update(is_owned: true_false)
  
  end
  
end
