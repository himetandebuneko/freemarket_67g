class Delivery < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day
  belongs_to_active_hash :fee
  belongs_to_active_hash :status
end
