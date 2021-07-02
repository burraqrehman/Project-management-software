class Client < ApplicationRecord

  has_many :projects
  has_many :comments
  has_many :payments

  validates :name, :address, :profession, presence: true
  validates :contact, presence: true, numericality: true
  validates :email, presence: true, format: { with: Devise.email_regexp, on: :create }, uniqueness: { case_sensitive: false }
  
end
