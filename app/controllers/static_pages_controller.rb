class StaticPagesController < ApplicationController
  def home
    @products = Product.all
    @product = Product.new
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
