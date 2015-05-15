class Organization < ActiveRecord::Base
	has_many :contacts
	has_many :ads
	has_many :insertions, through: :ads
end
