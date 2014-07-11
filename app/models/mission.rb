class Mission < ActiveRecord::Base
	has_and_belongs_to_many :jobs
	has_many :floors, through: :jobs
end
