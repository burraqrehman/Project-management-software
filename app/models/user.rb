class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :enum, presence: true
  validates :contact, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, on: :create }

  has_many :projects
  has_many :comments

  ROLES= {
    admin: 'admin',
    manager: 'manager',
    member: 'member'
  }

  enum roles: ROLES
  
end
