class Project < ApplicationRecord

	belongs_to :user

	has_many :comments, dependent: :destroy
	
	has_one_attached :image

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :documentation, presence: true
	validates :project_cost, presence: true, numericality: true
	validates :time_tracking, presence: true
	validates :image, presence: true


end
