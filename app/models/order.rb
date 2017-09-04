class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_and_belongs_to_many :items

  validates :bill, presence: true
  validates_format_of :phone_number, :with => /\A[0]{0,1}[7]{1}[7-9]{1}[0-9]{7}$\Z/

  enum status: {
    recived: 0,
    prepared: 1,
    delivering: 2,
    delivered: 3
  }
end
