class Project < ApplicationRecord

	belongs_to :user

	has_many :comments, dependent: :destroy
	
	has_one_attached :image

	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :documentation, :time_tracking, :image, presence: true
	validates :project_cost, presence: true, numericality: true

end
