class Category < ApplicationRecord
  has_many :novels
  
  validates :name, presence: true
  validates :description, presence: true
end
