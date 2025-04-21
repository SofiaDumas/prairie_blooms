class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :street, :city, :postal_code, :province, presence: true
  validates :postal_code, format: { with: /\A\d{5}(-\d{4})?\z/, message: "must be a valid postal code" }
  has_many :orders, dependent: :destroy
end
