class FloorsController < ApplicationController
    include FloorsHelper

	def show
  		@floors_owned = Floor.select("name, is_owned").where("is_owned is true")
  		@show_floors = Floor.where("floor_type != 'Residential'").order("floor_type, name")
  		@floors_audit = Floor.select("floor_type").where("is_owned is true").group("floor_type").count

	end

	def new
		# @floor = Floor.new
	end

	def create
	end

	def update
	    @floor = Floor.find(params[:id])
	    @floor.is_owned = !@floor.is_owned
	    @floor.save

	    @mission = Mission.joins(:floors).where("floors.id = ?", params[:id]).readonly(false)
	    @mission.each do |mission_hash|
            floors = Floor.joins(:missions).where(['mission_id = ?', mission_hash.id])
            mission_hash.update_attribute(:is_eligible, mission_is_eligible(floors))
            mission_hash.update_attribute(:updated_at,Time.now)
        end
	    redirect_to root_url
	end

    def index
    end

end
