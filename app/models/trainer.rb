class Trainer < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations
  has_many :reviews
  has_many :chats
  has_many :messages, through: :chats
  has_one_attached :profile_image
  belongs_to :prefecture

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :encrypted_password
    validates :last_name
    validates :first_name
    validates :last_name_reading
    validates :first_name_reading
    validates :age, numericality: { only_integer: true }
    validates :sex_id
    validates :prefecture_id
    validates :city
  end
end
