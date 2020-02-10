class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_one :delivery
  has_one :todo
  
  validates :name, presence: true
  validates :category_id, presence: true
  

  accepts_nested_attributes_for :images, allow_destroy: true
end
