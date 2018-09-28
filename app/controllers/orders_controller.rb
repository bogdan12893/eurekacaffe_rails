# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :logged_in_user

  def index
    set_orders
  end

  def destroy
    Order.find(params[:id]).destroy
    flash[:success] = 'Order Canceled'
    redirect_to orders_url
  end

  def toggle
    @order = Order.find(params[:order_id])
    @orders = Order.all
    respond_to do |format|
      format.js
    end
    @order.update_attributes(complete: params[:complete])
  end

  private

  def set_orders
    @orders = current_user.admin? ? Order.where(sent: true) : current_user.orders
  end
end
