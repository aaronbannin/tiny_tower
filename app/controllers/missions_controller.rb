class MissionsController < ApplicationController
    def show
    end

    def update
   	    @mission = Mission.find(params[:id])
	    @mission.is_complete = !@mission.is_complete
	    @mission.save
	    redirect_to missions_path
    end

    def index
        @show_missions = Mission.all.order("id")
        @open_missions = Mission.all.where("is_complete is false")
        @missions_audit = Mission.group("is_complete").count
        @missions_eligible = Mission.all.where("is_eligible is true and is_complete is false")
    end
end
