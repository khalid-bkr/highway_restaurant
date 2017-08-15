class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :nullify

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :phone_number, :with => /\A[0]{0,1}[7]{1}[7-9]{1}[0-9]{7}$\Z/
end
