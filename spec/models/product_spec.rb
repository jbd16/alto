require 'rails_helper'

describe Product do 
	context "when the product has comments"
	before do
		@product = Product.create!(name: "race bike")
	end



	before do
		@user = User.create!(email: "janedoe@gmail.com", password: "12345678")

	end



	before do
		@product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
		@product.comments.create!(rating: 3, user: @user, body: "Ok bike!")
		@product.comments.create!(rating: 5, user: @user, body: "Great bike!")
	

	it "returns the average rating of all comments" do
		expect(@product.total).to eq "3"
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

	

end
end