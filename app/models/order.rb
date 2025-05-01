class Order < ApplicationRecord
  validates :status, presence: true
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :address, presence: true
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  has_many :payments, dependent: :destroy
  enum :status, { pending: 0, paid: 1, shipped: 2 }
end
