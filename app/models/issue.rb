class Issue < ActiveRecord::Base
	belongs_to :magazine
	has_many :articles
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	
end
