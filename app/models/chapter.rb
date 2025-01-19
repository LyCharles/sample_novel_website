class Chapter < ApplicationRecord
  belongs_to :novel
  
  validates :title, presence: true
  validates :content, presence: true
  validates :chapter_number, presence: true, numericality: { only_integer: true }
end
