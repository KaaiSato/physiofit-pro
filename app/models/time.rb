class Time < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '6:00〜' },
    { id: 3, name: '6:30〜' },
    { id: 4, name: '7:00〜' },
    { id: 5, name: '7:30〜' },
    { id: 6, name: '8:00〜' },
    { id: 7, name: '8:30〜' },
    { id: 8, name: '9:00〜' },
    { id: 9, name: '9:30〜' },
    { id: 10, name: '10:00〜' },
    { id: 11, name: '10:30〜' },
    { id: 12, name: '11:00〜' },
    { id: 13, name: '11:30〜' },
    { id: 14, name: '12:00〜' },
    { id: 15, name: '12:30〜' },
    { id: 16, name: '13:00〜' },
    { id: 17, name: '13:30〜' },
    { id: 18, name: '14:00〜' },
    { id: 19, name: '14:30〜' },
    { id: 20, name: '15:00〜' },
    { id: 21, name: '15:30〜' },
    { id: 22, name: '16:00〜' },
    { id: 23, name: '16:30〜' },
    { id: 24, name: '17:00〜' },
    { id: 25, name: '17:30〜' },
    { id: 26, name: '18:00〜' },
    { id: 27, name: '18:30〜' },
    { id: 28, name: '19:00〜' },
    { id: 29, name: '19:30〜' },
    { id: 30, name: '20:00〜' },
    { id: 31, name: '20:30〜' },
    { id: 32, name: '21:00〜' },
    { id: 33, name: '21:30〜' },
    { id: 34, name: '22:00〜' },
    { id: 35, name: '22:30〜' }
  ]

  include ActiveHash::Associations
  has_many :reservations
end
