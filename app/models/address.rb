class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  # validates :postcode, :prefecture_id, :city, :housenumber, :housename, :phonenumber, presence: true
  # validates :user, presence: true
  # validates :user_id, presence: true
end
