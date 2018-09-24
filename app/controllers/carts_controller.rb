class CartsController < ApplicationController
	before_action :logged_in_user
	before_action :current_order
	
  def show
		@order_items = current_order.order_items
	end

	def destroy
		@order_items = current_order.order_items
		@order_items.destroy
		flash[:danger] = "All products were removed."
    redirect_to carts_path
	end
	
	private 
		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
		end
end
