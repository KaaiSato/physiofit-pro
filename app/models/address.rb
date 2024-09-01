class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :reservation
  belongs_to :prefecture

  with_options presence: true do
   validates :prefecture_id
   validates :city
   validates :addresses
   validates :phone_number, format:{ with: /\A\d{10,11}\z/, message: "is invalid. Input only 10 or 11 digits without hyphens" }
  end
end
