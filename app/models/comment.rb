class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :product

	validates_presence_of :body, :rating
	validates_uniqueness_of :user_id, scope: :product_id
end
