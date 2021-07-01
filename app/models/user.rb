class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :contact, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: Devise.email_regexp, on: :create }, uniqueness: { case_sensitive: false }


  ROLES= {
    admin: 'admin',
    manager: 'manager',
    member: 'member'
  }

  enum roles: ROLES

  def active_for_authentication?
    super and self.active?
  end

end
