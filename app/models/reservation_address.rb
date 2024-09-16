class ReservationAddress
  include ActiveModel::Model
  attr_accessor :trainer_id, :user_id, :last_name, :first_name, :last_name_reading, :first_name_reading, :date, :time_id, :request, :prefecture_id, :city, :addresses, :phone_number

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龠々ー]+\z/ }
    validates :last_name_reading, format: { with: /\A[ぁ-んー]+\z/ }
    validates :first_name_reading, format: { with: /\A[ぁ-んー]+\z/ }
    validates :date
    validates :time_id
    validates :request
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only 10 or 11 digits without hyphens" }
  end


  def save
    reservation = Reservation.create(trainer_id: trainer_id, user_id: user_id, last_name: last_name, first_name: first_name, last_name_reading: last_name_reading, first_name_reading: first_name_reading, date: date, time_id: time_id, request: request)
    Address.create(prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, reservation_id: reservation.id)
  end
end