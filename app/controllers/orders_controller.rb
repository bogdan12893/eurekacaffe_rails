class OrdersController < ApplicationController
  before_action :logged_in_user
  
  def index
    set_orders
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "Order canceled"
    redirect_to orders_url
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
        @orders = Order.where(sent: true)
      else
        @orders = current_user.orders
      end
    end
end
