class Job < ActiveRecord::Base
	has_and_belongs_to :floor
	has_and_belongs_to :mission
end
