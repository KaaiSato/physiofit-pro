class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :reviews
  has_many :chats
  has_many :messages, through: :chats
  has_one_attached :profile_image
  belongs_to :gender
  belongs_to :prefecture

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i }
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :gender_id
    validates :prefecture_id
    validates :city
    validates :profile
  end
end


