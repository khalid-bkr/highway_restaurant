class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :name , presence: true
  validates :price , presence: true, length: { minimum: 0 }
  validates :category , presence: true

  enum category: {
    meals: 0,
    burgers: 1,
    sandwiches: 2,
    sides: 3,
    drinks: 4
  }

end
