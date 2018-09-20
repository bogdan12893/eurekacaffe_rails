class StaticPagesController < ApplicationController
  def home
    @products = Product.all
    @order_item = OrderItem.new
  end

  def about
  end

  def service
  end

  def blog
  end

  def contact
  end
end
