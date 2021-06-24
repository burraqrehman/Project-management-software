class Client < ApplicationRecord

  validates :name, presence: true
  validates :contact, presence: true, numericality: { only_integer: true}
  validates :address, presence: true
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :profession, presence: true
  
end
