class Client < ApplicationRecord

  has_many :projects
  has_many :comments

  validates :name, :address, :profession, presence: true
  validates :contact, presence: true, numericality: { only_integer: true}
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, on: :create }, uniqueness: { case_sensitive: false }
  
end
