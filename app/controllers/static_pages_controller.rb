class StaticPagesController < ApplicationController
  def home
  	@floors_owned = Floor.select("name, is_owned").where("is_owned is true")
  	@show_floors = Floor.select("floor_type, name, is_owned").where("floor_type != 'Residential'").order("floor_type, name")
  	@floors_audit = Floor.select("floor_type").where("is_owned is true").group("floor_type").count
  end
  
  def help
  end
end
