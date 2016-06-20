require 'rails_helper'

describe UsersController, :type => :controller do 

	let(:user) { User.create!(first_name: "Peetah", last_name: "Pevensie", email: "peter@example.com", password: "1234567890")}
	let(:user) { User.create!(first_name: "Joe", last_name: "Jones", email: "joe@example.com", password: "2323232323")}

	describe "GET #show" do
	    context "User is logged in" do
	      before do
	      	sign_in user
	      end
	    

	      
	      	it "loads correct user details" do
	      	  get :show, id: user.id
	      	  expect(response).to be_success
	      	  expect(response).to have_http_status(200)
	      	  expect(assigns(:user)).to eq user
	      	end
	      end

	    context "No user is logged in" do
      	 it "redirects to login" do
         get :show, id: user.id
         expect(response).to redirect_to(root_path)
       end

	    end

	    context "User can only see their page" do
	    	it "user name and password show to correct user" do
	    		get :show, id: user.id
	    		expect(actual).to include(user.id)
	    	end
	   	end

	  end
end