class OrdersController < ApplicationController
  before_action :logged_in_user 
  
  def index
    set_orders
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = "Order Canceled"
    redirect_to orders_url
  end

  def toggle
    @order = Order.find(params[:order_id])
    all_orders
    @order.update_attributes(:complete => params[:complete])
  end
  

  private 
    def set_orders
      if current_user.admin?
        @orders = Order.where(sent: true)
      else
        @orders = current_user.orders
      end
    end

    def all_orders
      @orders = Order.all
      respond_to do |format|
        format.js
      end
    end
end
