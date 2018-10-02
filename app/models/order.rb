# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  validates :user_id, presence: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    subtotal + shipping_tax
  end

  def shipping_tax
    shipping = 5
  end
end
