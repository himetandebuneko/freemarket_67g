class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shippingdate
  belongs_to_active_hash :payer
  belongs_to_active_hash :condition
  belongs_to_active_hash :size
end
