class FloorsController < ApplicationController
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
	    redirect_to root_url
	end


end
