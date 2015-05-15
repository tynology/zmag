class Ad < ActiveRecord::Base
	has_many :insertions
	belongs_to :organization
end
