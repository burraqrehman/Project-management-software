class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :contact, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :enum, presence: true

  has_many :projects
  has_many :comments

  enum roles: {
    admin: 'admin',
    manager: 'manager',
    member: 'member'
  }

end
