class Insertion < ActiveRecord::Base
	has_and_belongs_to_many :issues
	belongs_to :ad
	
end
