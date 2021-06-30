class Project < ApplicationRecord

	belongs_to :client

	has_many :comments, dependent: :destroy
	has_many :payments
	
	has_one_attached :image

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :documentation, :time_tracking, presence: true
	validates :project_cost, presence: true, numericality: true

end
