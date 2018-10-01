# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :logged_in_user

  def show
    @order_items = current_order.order_items
  end

  def empty
    @order_items = current_order.order_items
    @order_items.destroy_all
    flash[:danger] = 'All products were removed.'
    redirect_to carts_path
  end

  def create
    @order = current_order
    @order.update(sent: true)
    redirect_to orders_path if @order.save
  end
end
