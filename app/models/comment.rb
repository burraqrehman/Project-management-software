class Comment < ApplicationRecord

  belongs_to :project
  belongs_to :client

  validates :content, presence: true

end
