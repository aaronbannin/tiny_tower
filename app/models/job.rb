class Job < ActiveRecord::Base
	has_and_belongs_to_many :floor
	has_and_belongs_to_many :mission
	
	
end
