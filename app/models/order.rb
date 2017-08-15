class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates :bill, presence: true

  enum status: {
    recived: 0,
    prepared: 1,
    delivering: 2,
    delivered: 3
  }
end
