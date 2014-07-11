class Floor < ActiveRecord::Base
	has_and_belongs_to_many :jobs
	has_many :missions, through: :jobs
end
