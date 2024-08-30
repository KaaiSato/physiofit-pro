class Reservation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :trainer
  belongs_to :user
  has_one :address
  belongs_to :time
  
 with_options presence: true do
   validates :last_name ,format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
   validates :first_name ,format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
   validates :last_name_reading ,format: { with: /\A[ぁ-んー]+\z/ }
   validates  :first_name_reading ,format: { with: /\A[ぁ-んー]+\z/ }
   validates  :date, :time_id
   validates :request
 end
end

