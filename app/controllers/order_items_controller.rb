# frozen_string_literal: true

class OrderItemsController < ApplicationController

  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_item_params)

    if @order.save
      flash[:success] = 'Item placed in cart'
    else
      flash[:danger] = 'Item not placed'
    end

    session[:order_id] = @order.id
    redirect_to root_path
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    
    redirect_to carts_path if @order_item.update_attributes(order_item_params)
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])

    redirect_to carts_path if @order_item.destroy
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_order
    @order = current_order
  end

end
