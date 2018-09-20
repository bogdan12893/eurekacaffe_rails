class Product < ApplicationRecord
	has_many :order_items
	has_one_attached :photo
	validates :title, presence: true
	validates :description, presence: true, length: { maximum: 100 }
	validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 100 }
end
