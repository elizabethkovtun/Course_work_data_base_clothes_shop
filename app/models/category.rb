class Category < ApplicationRecord
	has_many :products
	has_ancestry
	
	validates :title, presence: true

	before_validation do
  	self.ancestry = nil if self.ancestry.blank?
  end


	def to_param
   "#{id}-#{title.gsub(/[^a-z0-9]+/i, '-')}"
 end


end
