class Payment < ApplicationRecord
  validates :payment_method, :payment_status, presence: true
  validates :amount, numericality: { greater_than: 0 }
  belongs_to :order
end
