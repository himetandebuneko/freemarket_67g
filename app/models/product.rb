class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_one :delivery
  has_one :todo
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :size, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  validates :shippingaddress, presence: true
  validates :shippingdate, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  # validates :images, presence: true
  

  accepts_nested_attributes_for :images, allow_destroy: true
end
