class Product < ActiveRecord::Base
	has_many :orders
	belongs_to :user
	has_many :comments

	def average_rating
	 comments.average(:rating).to_f
	end
end
