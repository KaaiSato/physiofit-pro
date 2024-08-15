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
  belongs_to :gender
  belongs_to :prefecture

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,}+\z/i }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
    validates :last_name_reading, format: { with: /\A[ぁ-んー]+\z/ }
    validates :first_name_reading, format: { with: /\A[ぁ-んー]+\z/ }
    validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :gender_id
    validates :prefecture_id
    validates :city
    validates :registration_number, format: { with: /\A\d{6}\z/ }
    validates :career
    validates :profile
  end
end
