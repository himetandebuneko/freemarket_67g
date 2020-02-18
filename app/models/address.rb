class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :prefectures, :city, :housenumber, :housename, :phonenumber, presence: true
  validates :user_id, presence: true
  # validates :nickname, :email, :password, :lastname, :firstname, :lastnamekana, :firstnamekana, :birthday, presence: true
end
