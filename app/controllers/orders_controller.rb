# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :set_order, only: [:toggle, :destroy]

  def index
    set_orders
  end

  def destroy
    @order.destroy
    flash[:danger] = 'Order Canceled'
    redirect_to orders_url
  end

  def toggle
    @order
    @orders = Order.all
    respond_to do |format|
      format.js
    end
    @order.update_attributes(complete: params[:complete])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_orders
    @orders = current_user.admin? ? Order.where(sent: true) : current_user.orders
    flash[:success] = 'Order placed'
  end
end
