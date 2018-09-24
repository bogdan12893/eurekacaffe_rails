class OrdersController < ApplicationController
  before_action :logged_in_user
  
  def index
    set_orders
  end

  private 
		def logged_in_user
			unless logged_in?
				flash[:danger] = "Please log in."
				redirect_to login_url
			end
    end

    def set_orders
      if current_user.admin?
        @orders = Order.all
      else
        @orders = current_user.orders
      end
    end
end
