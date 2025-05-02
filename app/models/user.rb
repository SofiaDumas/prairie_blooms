class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :street, :city, :postal_code, :province, presence: true
  validates :postal_code,
            format: { with:    /\A[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d\z/i, # rubocop:disable Layout/LineLength
                      message: "must be a valid postal code" }
  has_many :orders, dependent: :destroy
  normalizes :email_address, with: ->(e) { e.strip.downcase }
  def full_address
    "#{street}, #{city}, #{postal_code}, #{province}"
  end
  attribute :admin, :boolean, default: false
end
