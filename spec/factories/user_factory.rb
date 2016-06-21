FactoryGirl.define do 
	sequence(:email) { |n| "user#{n}@example.com" }


	factory :user do
	  email 
	  password 
	  first_name 
	  last_name 
	  admin false
	end

	factory :admin, class: User do
  	  email 
  	  password 
  	  admin true
  	  first_name 
  	  last_name 
	end
end