class Product < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :images, dependent: :destroy
  # belongs_to :user
  belongs_to :category, optional: true
  has_one :delivery
  has_one :todo
end
