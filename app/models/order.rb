# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :set_subtotal, :set_shipping, :set_total
  validates :user_id, presence: true

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def total
    subtotal + shipping
  end

  def shipping
    shipping = 5
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    self[:total] = total
  end

  def set_shipping
    self[:shipping] = shipping
  end
end
