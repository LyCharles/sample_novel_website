class Novel < ApplicationRecord
  belongs_to :category
  has_many :chapters, dependent: :destroy
  
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
