class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :nickname, :lastname, :firstname, :lastnamekana, :firstnamekana, :birthday, presence: true
  validates :address, presence: true
  has_many :comments, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :news, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end