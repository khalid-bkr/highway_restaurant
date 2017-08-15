class Item < ApplicationRecord
  validates :name , presence: true
  validates :price , presence: true, length: { minimum: 0 }
  validates :category , presence: true

  enum category: {
    meals: 0,
    burgers: 1,
    sides: 2,
    drinks: 3
  }

end
