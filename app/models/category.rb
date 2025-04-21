class Category < ApplicationRecord
  validates :category_name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :products, dependent: :destroy
end
