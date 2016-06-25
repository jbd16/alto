class OrdersController < ApplicationController

	before_filter :authenticate_user!

	def create
		(:product_id, :user_id, :total)	
	end

	def index
	end

	def show
	end

	def new
	end

	def create
	end

	def destroy
	end


end